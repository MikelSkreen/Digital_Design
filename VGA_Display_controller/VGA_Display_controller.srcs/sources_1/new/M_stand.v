`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2014 11:29:57 PM
// Design Name: 
// Module Name: M_stand
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module M_stand(
    input [9:0]h,    //Horizontal count
    input [9:0]v,    //Verticle count
    input in_range,
    input clk,
    output reg [3:0]R,
    output reg [3:0]B,
    output reg [3:0]G
    );
    
always@(in_range, clk)
begin
    if (in_range == 1'd1)
    begin
        if (clk == 1'b1)
        begin
            if (((h >= 416 && h < 497) && (v >= 259 && v < 276)) | // Hat/Shirt
                ((h >= 400 && h < 528) && (v >= 275 && v < 291)) |
                ((h >= 400 && h < 432) && (v >= 371 && v < 387)) |
                ((h >= 384 && h < 432) && (v >= 387 && v < 403)) |
                ((h >= 368 && h < 432) && (v >= 403 && v < 419)) |
                ((h >= 400 && h < 416) && (v >= 419 && v < 435)) |
                ((h >= 496 && h < 528) && (v >= 371 && v < 387)) |
                ((h >= 496 && h < 544) && (v >= 387 && v < 403)) |
                ((h >= 496 && h < 560) && (v >= 403 && v < 419)) |
                ((h >= 448 && h < 480) && (v >= 371 && v < 403)) |
                ((h >= 512 && h < 528) && (v >= 419 && v < 435)))
                begin
                    R = 4'b1111;
                    G = 4'b0000;
                    B = 4'b0000;
                end
             
                  
            else if (((h >= 448 && h < 480) && (v >= 291 && v < 307)) | // Skin
                ((h >= 432 && h < 480) && (v >= 307 && v < 323)) |
                ((h >= 448 && h < 496) && (v >= 323 && v < 339)) |
                ((h >= 400 && h < 416) && (v >= 307 && v < 323)) |
                ((h >= 400 && h < 416) && (v >= 323 && v < 339)) |
                ((h >= 496 && h < 512) && (v >= 291 && v < 307)) |
                ((h >= 496 && h < 544) && (v >= 307 && v < 323)) |
                ((h >= 512 && h < 560) && (v >= 323 && v < 339)) |
                ((h >= 528 && h < 560) && (v >= 419 && v < 435)) |
                ((h >= 512 && h < 560) && (v >= 435 && v < 451)) |
                ((h >= 528 && h < 560) && (v >= 451 && v < 467)) |
                ((h >= 368 && h < 400) && (v >= 419 && v < 435)) |
                ((h >= 368 && h < 416) && (v >= 435 && v < 451)) |
                ((h >= 368 && h < 400) && (v >= 451 && v < 467)) |
                ((h >= 416 && h < 480) && (v >= 339 && v < 355)) |
                ((h >= 416 && h < 528) && (v >= 355 && v < 371)))
                begin
                    R = 4'b1111;
                    G = 4'b1111;
                    B = 4'b0000;
                end
            
            else if (((h >= 432 && h < 448) && (v >= 371 && v < 419)) | // Overalls
                ((h >= 480 && h < 496) && (v >= 371 && v < 419)) |
                ((h >= 448 && h < 480) && (v >= 403 && v < 451)) |
                ((h >= 416 && h < 432) && (v >= 419 && v < 451)) |
                ((h >= 432 && h < 448) && (v >= 435 && v < 451)) |
                ((h >= 496 && h < 512) && (v >= 419 && v < 451)) |
                ((h >= 480 && h < 512) && (v >= 435 && v < 451)) |
                ((h >= 400 && h < 448) && (v >= 451 && v < 483)) |
                ((h >= 480 && h < 528) && (v >= 451 && v < 483)))
                begin
                    R = 4'b0000;
                    G = 4'b0000;
                    B = 4'b1111;
                end
                 
            else if (((h >= 400 && h < 448) && (v >= 291 && v < 307)) | // Hair/Shoes
                ((h >= 416 && h < 432) && (v >= 307 && v < 339)) |
                ((h >= 432 && h < 448) && (v >= 323 && v < 339)) |
                ((h >= 384 && h < 400) && (v >= 307 && v < 355)) |
                ((h >= 400 && h < 416) && (v >= 339 && v < 355)) |
                ((h >= 384 && h < 432) && (v >= 483 && v < 499)) |
                ((h >= 368 && h < 432) && (v >= 499 && v < 515)) |
                ((h >= 496 && h < 544) && (v >= 483 && v < 499)) |
                ((h >= 480 && h < 496) && (v >= 291 && v < 323)) |
                ((h >= 496 && h < 560) && (v >= 499 && v < 516)))
                begin
                    R = 4'b0011;
                    G = 4'b0011;
                    B = 4'b0011;
                end
            
            else if (((h >= 496 && h < 512) && (v >= 323 && v < 339)) | // The Stache
                 ((h >= 480 && h < 544) && (v >= 339 && v < 355)))
                 begin
                    R = 4'b0000;
                    G = 4'b0000;
                    B = 4'b0000;
                 end
                 
            else if (((h >= 432 && h < 448) && (v >= 419 && v < 435)) | // Buttons
                ((h >= 480 && h < 496) && (v >= 419 && v < 435)))
                begin
                     R = 4'b0111;
                     G = 4'b0111;
                     B = 4'b0000;
                end
                
            else
                begin
                    R = 4'b0111;
                    G = 4'b0111;
                    B = 4'b0111;
                end
        end
        
        else
        begin 
            if (((h >= 416 && h < 496) && (v >= 195 && v < 211)) | // Hat/Shirt
                 ((h >= 400 && h < 528) && (v >= 211 && v < 227)) |
                 ((h >= 528 && h < 576) && (v >= 227 && v < 243)) |
                 ((h >= 544 && h < 576) && (v >= 243 && v < 259)) |
                 ((h >= 560 && h < 576) && (v >= 259 && v < 275)) |
                 ((h >= 368 && h < 432) && (v >= 307 && v < 323)) |
                 ((h >= 368 && h < 448) && (v >= 323 && v < 339)) |
                 ((h >= 384 && h < 448) && (v >= 339 && v < 355)) |
                 ((h >= 448 && h < 496) && (v >= 307 && v < 323)) |
                 ((h >= 512 && h < 544) && (v >= 307 && v < 323)) |
                 ((h >= 528 && h < 560) && (v >= 291 && v < 307)) |
                 ((h >= 544 && h < 560) && (v >= 275 && v < 291)) |
                 ((h >= 464 && h < 512) && (v >= 323 && v < 339)))
                 begin
                     R = 4'b1111;
                     G = 4'b0000;
                     B = 4'b0000;
                 end 
                 
              else if (((h >= 432 && h < 448) && (v >= 307 && v < 323)) | // Overalls
                  ((h >= 496 && h < 512) && (v >= 307 && v < 323)) |
                  ((h >= 448 && h < 464) && (v >= 323 && v < 339)) |
                  ((h >= 448 && h < 512) && (v >= 339 && v < 355)) |
                  ((h >= 400 && h < 464) && (v >= 335 && v < 403)) |
                  ((h >= 512 && h < 528) && (v >= 323 && v < 339)) |
                  ((h >= 528 && h < 560) && (v >= 339 && v < 355)) |
                  ((h >= 480 && h < 560) && (v >= 355 && v < 371)) |
                  ((h >= 464 && h < 560) && (v >= 371 && v < 387)) |
                  ((h >= 464 && h < 496) && (v >= 387 && v < 403)))
                  begin
                      R = 4'b0000;
                      G = 4'b0000;
                      B = 4'b1111;
                  end  
                  
                else if (((h >= 448 && h < 480) && (v >= 227 && v < 243)) | // Skin
                    ((h >= 432 && h < 480) && (v >= 243 && v < 259)) |
                    ((h >= 448 && h < 496) && (v >= 259 && v < 275)) |
                    ((h >= 528 && h < 576) && (v >= 195 && v < 227)) |
                    ((h >= 496 && h < 512) && (v >= 227 && v < 259)) |
                    ((h >= 512 && h < 544) && (v >= 243 && v < 275)) |
                    ((h >= 544 && h < 560) && (v >= 259 && v < 275)) |
                    ((h >= 416 && h < 480) && (v >= 275 && v < 307)) |
                    ((h >= 480 && h < 528) && (v >= 291 && v < 307)) |
                    ((h >= 400 && h < 416) && (v >= 243 && v < 275)) |
                    ((h >= 336 && h < 368) && (v >= 307 && v < 339)) |
                    ((h >= 352 && h < 384) && (v >= 339 && v < 355)))
                    begin
                       R = 4'b1111;
                       G = 4'b1111;
                       B = 4'b0000;
                    end
                     
               else if (((h >= 400 && h < 448) && (v >= 227 && v < 243)) | // Hair/Shoes
                      ((h >= 416 && h < 432) && (v >= 243 && v < 259)) |
                      ((h >= 416 && h < 448) && (v >= 259 && v < 275)) |
                      ((h >= 384 && h < 400) && (v >= 243 && v < 291)) |
                      ((h >= 400 && h < 416) && (v >= 275 && v < 291)) |
                      ((h >= 368 && h < 400) && (v >= 371 && v < 403)) |
                      ((h >= 352 && h < 368) && (v >= 387 && v < 419)) |
                      ((h >= 368 && h < 384) && (v >= 387 && v < 419)) |
                      ((h >= 560 && h < 576) && (v >= 323 && v < 387)) |
                      ((h >= 576 && h < 592) && (v >= 307 && v < 387)) |
                      ((h >= 480 && h < 496) && (v >= 227 && v < 259)))
                      begin
                          R = 4'b0011;
                          G = 4'b0011;
                          B = 4'b0011;
                      end 
                      
                else if (((h >= 496 && h < 512) && (v >= 259 && v < 275)) | // The Stache
                      ((h >= 480 && h < 544) && (v >= 275 && v < 291)))
                      begin
                           R = 4'b0000;
                           G = 4'b0000;
                           B = 4'b0000;
                      end
                      
                else if (((h >= 464 && h < 480) && (v >= 355 && v < 371)) | // Buttons
                      ((h >= 512 && h < 528) && (v >= 339 && v < 355)))
                      begin
                           R = 4'b0111;
                           G = 4'b0111;
                           B = 4'b0000;
                      end 
                
                else
                      begin
                          R = 4'b0111;
                          G = 4'b0111;
                          B = 4'b0111;
                      end
        end
               
    end
       
    else
        begin
            R = 4'b0000;
            G = 4'b0000;
            B = 4'b0000;
        end
end
    
endmodule
