module rtlpp_09519 (
    input  [7:0] A,
    input  [7:0] B,
    input        clk,
    output reg [15:0] sum
);

    wire   [7:0]   A_mag;         
    wire   [7:0]   B_mag;
    wire   [7:0]   p1, p2, p3, p4, p5, p6, p7, p8;        
    wire   [5:0]   lsb_sum21, lsb_sum22, lsb_sum23, lsb_sum24;
    wire   [4:0]   msb_sum31, msb_sum32, msb_sum33, msb_sum34;
    wire   [9:0]   sum31, sum32, sum33, sum34;
    wire   [7:0]   lsb_sum41, lsb_sum42;
    wire   [4:0]   msb_sum51, msb_sum52;
    wire   [11:0]  sum51, sum52;
    wire   [9:0]   lsb_sum6;
    wire   [6:0]   msb_sum7;      
    wire   [15:0]  sum_unsigned;
    wire           sign;           
    
    reg    [7:0]   p1_reg, p2_reg, p3_reg, p4_reg, p5_reg, p6_reg, p7_reg, p8_reg;
    reg    [5:0]   lsb_sum21_reg, lsb_sum22_reg, lsb_sum23_reg, lsb_sum24_reg;
    reg    [7:4]   p2_msb, p4_msb, p6_msb, p8_msb;
    reg    [7:5]   p1_msb, p3_msb, p5_msb, p7_msb;
    reg    [9:0]   sum31_reg, sum32_reg, sum33_reg, sum34_reg;
    reg    [7:0]   lsb_sum41_reg, lsb_sum42_reg;
    reg    [9:7]   msb_41, msb_43;
    reg    [9:5]   msb_42, msb_44;
    reg    [11:0]  sum51_reg, sum52_reg;
    reg    [9:0]   lsb_sum6_reg;
    reg    [11:9]  msb_61;
    reg    [11:5]  msb_62;
    reg    [15:0]  sum_unsigned_reg;
    reg            sign_s1, sign_s2, sign_s3, sign_s4, sign_s5, sign_s6, sign_s7;    
    
    assign A_mag = A[7] ? ~A[7:0] + 1 : A[7:0];               
    assign B_mag = B[7] ? ~B[7:0] + 1 : B[7:0];  
    
    assign p1 = A_mag * B_mag[0];
    assign p2 = A_mag * B_mag[1];
    assign p3 = A_mag * B_mag[2];
    assign p4 = A_mag * B_mag[3];
    assign p5 = A_mag * B_mag[4];
    assign p6 = A_mag * B_mag[5];
    assign p7 = A_mag * B_mag[6];
    assign p8 = A_mag * B_mag[7];
    
    assign sign = A[7] ^ B[7];  
    
    always @(posedge clk) begin
        p1_reg <= p1;
        p3_reg <= p3;
        p5_reg <= p5;
        p7_reg <= p7;
        p2_reg <= p2;
        p4_reg <= p4;
        p6_reg <= p6;
        p8_reg <= p8;
        sign_s1 <= sign;                              
    end
    
    assign lsb_sum21 = p1_reg[4:0] + {p2_reg[3:0], 1'b0};
    assign lsb_sum22 = p3_reg[4:0] + {p4_reg[3:0], 1'b0};  
    assign lsb_sum23 = p5_reg[4:0] + {p6_reg[3:0], 1'b0};  
    assign lsb_sum24 = p7_reg[4:0] + {p8_reg[3:0], 1'b0};  

    always @(posedge clk) begin    
        lsb_sum21_reg <= lsb_sum21;
        lsb_sum22_reg <= lsb_sum22;
        lsb_sum23_reg <= lsb_sum23;
        lsb_sum24_reg <= lsb_sum24;
        
        p1_msb <= p1_reg[7:5];
        p2_msb <= p2_reg[7:4];
        p3_msb <= p3_reg[7:5];
        p4_msb <= p4_reg[7:4];
        p5_msb <= p5_reg[7:5];
        p6_msb <= p6_reg[7:4];
        p7_msb <= p7_reg[7:5];
        p8_msb <= p8_reg[7:4];
        
        sign_s2 <= sign_s1;                   
    end
    
    assign msb_sum31 = p1_msb + p2_msb + lsb_sum21_reg[5];
    assign msb_sum32 = p3_msb + p4_msb + lsb_sum22_reg[5];
    assign msb_sum33 = p5_msb + p6_msb + lsb_sum23_reg[5];
    assign msb_sum34 = p7_msb + p8_msb + lsb_sum24_reg[5];
    
    assign sum31 = {msb_sum31[4:0], lsb_sum21_reg[4:0]};
    assign sum32 = {msb_sum32[4:0], lsb_sum22_reg[4:0]};
    assign sum33 = {msb_sum33[4:0], lsb_sum23_reg[4:0]};
    assign sum34 = {msb_sum34[4:0], lsb_sum24_reg[4:0]};
    
    always @(posedge clk) begin
        sum31_reg <= sum31;
        sum32_reg <= sum32;
        sum33_reg <= sum33;
        sum34_reg <= sum34;
    
        sign_s3 <= sign_s2;                   
    end
    
    assign lsb_sum41 = sum31_reg[6:0] + {sum32_reg[4:0], 2'b00};
    assign lsb_sum42 = sum33_reg[6:0] + {sum34_reg[4:0], 2'b00};   
    
    always @(posedge clk) begin
        lsb_sum41_reg <= lsb_sum41;
        lsb_sum42_reg <= lsb_sum42;
        
        msb_41 <= sum31_reg[9:7];
        msb_42 <= sum32_reg[9:5];
        msb_43 <= sum33_reg[9:7];
        msb_44 <= sum34_reg[9:5];
    
        sign_s4 <= sign_s3;               
    end
    
    assign msb_sum51 = msb_41 + msb_42 + lsb_sum41_reg[7];
    assign msb_sum52 = msb_43 + msb_44 + lsb_sum42_reg[7];
    
    assign sum51 = {msb_sum51[4:0], lsb_sum41_reg[6:0]};
    assign sum52 = {msb_sum52[4:0], lsb_sum42_reg[6:0]};
    
    always @(posedge clk) begin
        sum51_reg <= sum51;
        sum52_reg <= sum52;

        sign_s5 <= sign_s4;               
    end

    assign lsb_sum6 = sum51_reg[8:0] + {sum52_reg[4:0], 4'b0000};
   
    always @(posedge clk) begin
        lsb_sum6_reg <= lsb_sum6;

        msb_61 <= sum51_reg[11:9];
        msb_62 <= sum52_reg[11:5];            
    
        sign_s6 <= sign_s5;               
    end
    
    assign msb_sum7 = msb_61 + msb_62 + lsb_sum6_reg[9];
    
    assign sum_unsigned = {msb_sum7, lsb_sum6_reg[8:0]};             
    
    always @(posedge clk) begin
        sum_unsigned_reg <= sum_unsigned;                     
        
        sign_s7 <= sign_s6;                                  
    end
    
    always @(posedge clk) begin
        if(sign_s7 == 1'b0) 
            sum <= sum_unsigned_reg;
        else 
            sum <= ~sum_unsigned_reg[15:0] + 1;
    end

endmodule