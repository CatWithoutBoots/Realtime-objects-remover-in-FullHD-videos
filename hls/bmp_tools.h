// bmp_tools.h
#ifndef BMP_TOOLS_H
#define BMP_TOOLS_H

extern "C" {
    void read_bmp (const char* filename, unsigned int** img_data, int& height, int& width);
    void write_bmp (const char* filename, unsigned int* img_data, int& height, int& width);
}

#endif // BMP_TOOLS_H
