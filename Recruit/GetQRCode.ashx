<%@ WebHandler Language="C#" Class="GetQRCode" %>

using System;
using System.Web;

using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;
using ThoughtWorks.QRCode.Codec.Util;
using System.IO;
using System.Text;

public class GetQRCode : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        String data = context.Request["CodeText"];
        if (!string.IsNullOrEmpty(data))
        {
            QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE; 
            qrCodeEncoder.QRCodeScale = 4;
            qrCodeEncoder.QRCodeVersion = 8;
            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
            System.Drawing.Bitmap image = qrCodeEncoder.Encode(data);
            System.IO.MemoryStream MStream = new System.IO.MemoryStream();
            image.Save(MStream, System.Drawing.Imaging.ImageFormat.Png);
            context.Response.ClearContent();
            context.Response.ContentType = "image/Png";
            context.Response.BinaryWrite(MStream.ToArray());
        }

        context.Response.Flush();
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}