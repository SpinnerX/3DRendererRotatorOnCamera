#include <iostream>
#include <opencv4/opencv2/opencv.hpp>
#include <GLFW/glfw3.h>
#include "common/Utils.h"
#include <assimp/matrix3x3.h>
using namespace cv;


void OpenCVmain(){
    VideoCapture camera(0);

    while(camera.isOpened()){
        Mat frame;

        camera >> frame;

        imshow("Window", frame);
        waitKey(1);
    }
}

void testOpenGL(){
    if(glfwInit()){
        std::cout << "GLFW Init!\n";
    }
}

int main(){
    testOpenGL();
    printUtils();
    aiMatrix3x3 result_c = aiMatrix3x3(0,0,0,0,0,0,0,0,0);
    aiMatrix3x3 result_c2 = aiMatrix3x3(0,0,0,0,0,0,0,0,0);

    if(result_c == result_c2) std::cout << "True!\n";
    
}