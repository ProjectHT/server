/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: phamh
 *
 * Created on July 19, 2018, 9:14 AM
 */

#include <cstdlib>

#include "MyObject.h"
#include "server_ws.hpp"
#include <fstream>
#include <opencv2/opencv.hpp>

using namespace std;
using WsServer = SimpleWeb::SocketServer<SimpleWeb::WS>;
using namespace cv;

/*
 * 
 */
int main(int argc, char** argv) {
    WsServer server;
    server.config.port = 8080;

    auto &echo = server.endpoint["^/read_image/?$"];

    echo.on_message = [](shared_ptr<WsServer::Connection> connection, shared_ptr<WsServer::Message> message) {
        string msg = message->string();
        MyObject obj_msg;
        int index = 0;
        if (obj_msg.convertFromData(msg, index)) {
            if (obj_msg.name.compare("read_file_image") == 0) {
                if ((obj_msg.type.compare("string") == 0) && (obj_msg.size == 1)) {
                    string name_file = "/root/Workspace/ImageTest/" + string(*((string*)(obj_msg.data)));
                    Mat image;
                    image = imread(name_file.c_str(), CV_LOAD_IMAGE_COLOR);
                    if (!image.data) {
                        MyObject obj_error;
                        string error = "Khong tim thay file";
                        obj_error.set("error", error);
                        auto send_stream = make_shared<WsServer::SendStream>();
                        string buffer_msg = obj_error.convertToData();
                        *send_stream << buffer_msg;
                        connection->send(send_stream, [](const SimpleWeb::error_code &ec) {
                            if (ec) {
                                cout << "Server: Error sending message. " <<
                                        // See http://www.boost.org/doc/libs/1_55_0/doc/html/boost_asio/reference.html, Error Codes for error code meanings
                                        "Error: " << ec << ", error message: " << ec.message() << endl;
                            }
                        });
                    }
                    else {
                        vector<int> params;
                        params.push_back(CV_IMWRITE_JPEG_QUALITY);
                        params.push_back(100);
                        vector<uchar> buffer;
                        imencode(".jpg", image, buffer, params);
                        MyObject obj_image;
                        obj_image.set("image", (char*)(buffer.data()), buffer.size());
                        auto send_stream = make_shared<WsServer::SendStream>();
                        string buffer_msg = obj_image.convertToData();
                        *send_stream << buffer_msg;
                        connection->send(send_stream, [](const SimpleWeb::error_code &ec) {
                            if (ec) {
                                cout << "Server: Error sending message. " <<
                                        // See http://www.boost.org/doc/libs/1_55_0/doc/html/boost_asio/reference.html, Error Codes for error code meanings
                                        "Error: " << ec << ", error message: " << ec.message() << endl;
                            }
                        });
                    }
                }
            }
        }
    };

    Base64 m_base;
    printf("hello from my_server!\n");
    string str_1 = "abcdefghth";
    //vector<unsigned char> buffer;
    string encoder = m_base.encode((void*)(str_1.c_str()), str_1.length());
    cout << encoder << endl;
    vector<unsigned char> buffer = m_base.decode(encoder);
    for (unsigned char c : buffer) std::cout << c;
    std::cout << std::endl;

    thread server_thread([&server]() {
            server.start();
    });


    server_thread.join();
    return 0;
}

