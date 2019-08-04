using System;
using System.IO;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;

namespace ImageSharp.DockerSandbox
{
    class Program
    {
        public static void Main(string[] args)
        {
            var carImage = Image.Load<Rgba32>(@"Car.jpg");
            using (var fs = new FileStream("/app/docker_output/car_output.jpg", FileMode.Create))
            {
                carImage.SaveAsJpeg(fs);
                fs.Flush();
                fs.Close();
            }

            var lakeImage = Image.Load<Rgba32>(@"Lake.jpg");
            using (var fs = new FileStream("/app/docker_output/lake_output.jpg", FileMode.Create))
            {
                lakeImage.SaveAsJpeg(fs);
                fs.Flush();
                fs.Close();
            }

            Console.WriteLine("output written to docker_output");
        }
    }
}
