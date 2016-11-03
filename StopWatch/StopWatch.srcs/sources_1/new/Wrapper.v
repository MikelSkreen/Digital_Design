`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/25/2015 02:19:51 PM
// Design Name: 
// Module Name: Wrapper
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


module Wrapper(
    input clk,
//    input start,
    input reset,
//    input stop,
//    input inc,
    input PS2Clk,
    input PS2Data,
    output [6:0]seg,
    output [7:0]an,
    output reg dp,
    output reg [13:0]led,
    output En_Indi,
    output press
    );
    
    wire start;
    wire stop;
    wire inc;
   // wire reset;
    
//    wire hertClk;
//    wire khertClk;
//    reg [31:0] KHertCont = 100000;
//    reg [31:0] HertConst = 50000000;
    
    reg [15:0]Count;
    reg [N-1:0]count2; //the 18 bit counter which allows us to multiplex at 1000Hz
    //reg [1:0]CurrDigit;
    
    reg [3:0]firstd;
    reg [3:0]secondd;
    reg [3:0]thirdd;
    reg [3:0]fourthd;
    reg [1:0]CurrDigit;
    
    reg [2:0]pState;
    reg [1:0]nState;
    reg [6:0]sseg;
    reg [7:0]an_temp;
    reg [6:0]sseg_temp;
    
    reg [15:0]led_count;
    
    wire [15:0]code;
    
    wire En;
    wire En_Inc;
//    wire secondEn;
//    wire thirdEn;
//    wire fourthEn;
//    wire endEn;
    
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b011;
    localparam S3 = 3'b111;
    localparam S4 = 3'b110;
    
    reg [15:0]delay;
    wire newclk;
    
    always @ (posedge clk)
    begin
       delay <= delay +1;
    end
    
    assign newclk = &delay;
    
    reg [18:0] delay2; //register to produce the 0.1 second delay
    wire test;
     
    always @ (posedge clk or posedge reset)
     begin
      if (reset)
       delay2 <= 0;
      else
       delay2 <= delay2 + 1;
     end
      
    assign test = &delay2;
    
//clkDiv HertClk(
//    .clk(clk),
//    .rst(reset),
//    .constNum(HertConst),
//    .clk_div(hertClk)
//    );
        
//clkDiv KHertClk(
//    .clk(clk),
//    .rst(reset),
//    .constNum(KHertConst),
//    .clk_div(khertClk)
//    );
    
PS2_Keyboard kitty_poop(
    .clk_25(clk25),
    .rst(reset),
    .PS2Clk(PS2Clk),
    .PS2Data(PS2Data),
    .xkey(code),
    .space(press),
    .start(start),
    .stop(stop),
    .inc(inc)
    );


always @ (posedge test or posedge reset or posedge En or posedge En_Inc)
begin
    if (reset == 1'b1) 
    begin
        firstd <= 0;
        secondd <= 0;
        thirdd <= 0;
        fourthd <= 0;
        led <= 0;
    end
    else if (firstd == 4'd9) 
    begin  //xxx9 reached
        firstd <= 0;
        if (secondd == 4'd9) 
        begin //xx99 reached
            secondd <= 0;
            if (thirdd == 4'd9) 
            begin //x999 reached
                thirdd <= 0;
                //led <= led + 1;
                if (fourthd == 4'd9)
                begin //9999 reached
                   fourthd <= 0;
                   led <= led + 1'b1;
                end
                else if(En)
                    fourthd <= fourthd + 1;
            end
            else if(En)
                thirdd <= thirdd + 1;
        end
        else if(En)
            secondd <= secondd + 1;
    end
    else if(En)
        firstd <= firstd + 1;
        
    else if(En_Inc)
        if (firstd == 4'd9)
        begin //9999 reached
            firstd <= 0;
            led <= led + 1'b1;
        end
        else if(En)
            firstd <= firstd + 1;
end      

//    always @ (posedge test or posedge reset or posedge En)
//    begin
//        if(reset == 1'b1 || Count > 9999)
//            Count <= 0;
//        else if(En == 1'b1)
//            Count <= Count + 1'b1;
            
//        firstd <= Count % 10;
//        secondd <= (Count / 10) % 10;
//        thirdd <= (Count / 100) % 10;
//        fourthd <= (Count / 1000) % 10;
//    end

//always @ (posedge test, posedge En)
//begin 
//    if (reset == 1'b1)
//        Count <= 0;
//    else if(En)
//        Count <= Count + 1'b1;
//end 
        
always @(pState, start, stop, reset, inc)
begin
    case(pState)
        S0:begin
            if (inc == 1'b0 && start == 1'b0 && stop == 1'b0)
                nState = S0;
            else if (start == 1'b1 && stop == 1'b0 && inc == 1'b0)
                nState = S1;
            else if (stop == 1'b1 && start == 1'b0 && inc == 1'b0)
                nState = S2;
            else if (inc == 1'b1 && stop == 1'b0 && start == 1'b0)
                nState = S3;
            end
           
        S1:begin //start
            if (reset == 1'b1)
                nState = S0;
            else if (stop == 1'b1)
                nState = S2;
            else
                nState = S1;
            end
            
        S2:begin //reset
            if (reset == 1'b1)
                nState = S0;
            else if (start == 1'b1 && inc == 1'b0)
                nState = S1;
            else if (inc == 1'b1) begin
                nState = S3;
                //firstd = firstd + 1;
                end
            else
                nState = S2;
            end
        
        S3:begin //inc
                nState = S4;
            end
            
        S4:begin //
            if (inc == 1'b1)
                nState = S4;
            else 
                nState = S2;
            end
           
        default:
                nState = S0;
            
   endcase
end
  
localparam N = 18;
 
always @ (posedge clk or posedge reset)
begin
    if (reset)
        count2 <= 0;
    else
        count2 <= count2 + 1;
end
    
always @ (posedge (clk) or posedge (reset))
begin
    if (reset == 1'b1)
        pState <= S0;
    else
        pState <= nState;
end


reg [24:0]count3;

always @(posedge clk or posedge reset)
    begin
        if (reset == 1)
            count3 <= 0;
        else 
            count3 <= count3 + 1;
    end
    
assign clk25 = count3[0];
    
    
always@(*)
begin
    case(count2[N-1:N-2])
    2'b00: begin
        sseg <= firstd;
        an_temp <= 4'b1110;
        dp <= 1'b1;
    end
    
    2'b01: begin
        sseg <= secondd;
        an_temp <= 4'b1101;
        dp <= 1'b1;
    end
    
    2'b10: begin
        sseg <= thirdd;
        an_temp <= 4'b1011;
        dp <= 1'b1;
    end
     
    2'b11: begin
        sseg <= fourthd;
        an_temp <= 4'b0111;
        dp <= 1'd0;
    end
         
    endcase
end
  
    
    always @ (*)
    begin
        case(sseg)
            4'd0 : sseg_temp = 7'b1000000; //0
            4'd1 : sseg_temp = 7'b1111001; //1
            4'd2 : sseg_temp = 7'b0100100; //2
            4'd3 : sseg_temp = 7'b0110000; //3
            4'd4 : sseg_temp = 7'b0011001; //4
            4'd5 : sseg_temp = 7'b0010010; //5
            4'd6 : sseg_temp = 7'b0000010; //6
            4'd7 : sseg_temp = 7'b1111000; //7
            4'd8 : sseg_temp = 7'b0000000; //8
            4'd9 : sseg_temp = 7'b0010000; //9
            default : sseg_temp = 7'b0111111; //dash
        endcase
    end
    assign an[3:0] = an_temp[3:0];
    assign seg = sseg_temp;
    assign an[7:4] = 4'b1111;
    assign En = (pState == S1 | pState == S3) ? 1'd1: 1'd0;
    //assign En_Inc = pState == S3 ? 1'd1: 1'd0;
    assign En_Indi = En | inc;
				

//assign led[3] = hertClk;
//assign led[2] = tenhertClk;
//assign led[1] = hunhertClk;
//assign led[0] = khertClk;

endmodule
