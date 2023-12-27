#include "svg.h"
#include "blend2d.h"
#include <string>
#include <fstream>
#include <vector>




bool readFile(const char* filePath ,std::vector<unsigned char>& buff)
{
    std::ifstream file(filePath, std::ios::binary);
    if (!file) {
        
        return false;
    }

    
    file.seekg(0, std::ios::end);
    std::streamsize size = file.tellg();
    file.seekg(0, std::ios::beg);
    
    std::vector<unsigned char> buffer(size);
    if (!file.read(reinterpret_cast<char*>(buffer.data()), size)) {
        return false;
    }

    
    buffer.swap(buff);
    file.close();
    return true;
}


int main()
{
	const char* svgFilePath = R"(D:\temp\1227svg_blend2d\svg2b2d\resources\example.svg)";
    std::vector<unsigned char> buff;
    bool ret = readFile(svgFilePath, buff);
    if (!ret)
        return -1;
    BLImage img;
    parseSVG(buff.data(), buff.size(), img);

    int w = img.width();
    int h = img.height();

    img.writeToFile("output_svg.png");


    {
        parseSVG(buff.data(), buff.size(), img, w * 1.2, h * 1.2);
        w = img.width();
        h = img.height();

        img.writeToFile("output_svg2.png");
    }
    


	return 0;
}