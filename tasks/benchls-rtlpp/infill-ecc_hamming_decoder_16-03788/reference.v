module rtlpp_03788
(
    dec_in,
    parity_in,
    ecc_en,
    dec_out,
    error
);

    input [15:0] dec_in;
    input [5:0] parity_in;
    input ecc_en;
    output [15:0] dec_out;
    output [1:0] error;

    wire [5:0] syndrome_chk;
    assign syndrome_chk[0] = ((((((((dec_in[0] ^ dec_in[1]) ^ dec_in[3]) ^ dec_in[4]) ^ dec_in[6]) ^ dec_in[8]) ^ dec_in[10]) ^ dec_in[11]) ^ dec_in[13]) ^ dec_in[15];
    assign syndrome_chk[1] = (((((((dec_in[0] ^ dec_in[2]) ^ dec_in[3]) ^ dec_in[5]) ^ dec_in[6]) ^ dec_in[9]) ^ dec_in[10]) ^ dec_in[12]) ^ dec_in[13];
    assign syndrome_chk[2] = (((((((dec_in[1] ^ dec_in[2]) ^ dec_in[3]) ^ dec_in[7]) ^ dec_in[8]) ^ dec_in[9]) ^ dec_in[10]) ^ dec_in[14]) ^ dec_in[15];
    assign syndrome_chk[3] = (((((dec_in[4] ^ dec_in[5]) ^ dec_in[6]) ^ dec_in[7]) ^ dec_in[8]) ^ dec_in[9]) ^ dec_in[10];
    assign syndrome_chk[4] = (((dec_in[11] ^ dec_in[12]) ^ dec_in[13]) ^ dec_in[14]) ^ dec_in[15];
    assign syndrome_chk[5] = (((((((((((((((((((dec_in[0] ^ dec_in[1]) ^ dec_in[2]) ^ dec_in[3]) ^ dec_in[4]) ^ dec_in[5]) ^ dec_in[6]) ^ dec_in[7]) ^ dec_in[8]) ^ dec_in[9]) ^ dec_in[10]) ^ dec_in[11]) ^ dec_in[12]) ^ dec_in[13]) ^ dec_in[14]) ^ dec_in[15]) ^ parity_in[4]) ^ parity_in[3]) ^ parity_in[2]) ^ parity_in[1]) ^ parity_in[0];
    
    reg [15:0] mask;
    wire [5:0] syndrome;
    reg [1:0] error;
    
    assign syndrome = syndrome_chk ^ parity_in;
    
    always @(syndrome) 
    begin
        case (syndrome)
            6'd35 : mask = 16'd1;
            6'd37 : mask = 16'd2;
            6'd38 : mask = 16'd4;
            6'd39 : mask = 16'd8;
            6'd41 : mask = 16'd16;
            6'd42 : mask = 16'd32;
            6'd43 : mask = 16'd64;
            6'd44 : mask = 16'd128;
            6'd45 : mask = 16'd256;
            6'd46 : mask = 16'd512;
            6'd47 : mask = 16'd1024;
            6'd49 : mask = 16'd2048;
            6'd50 : mask = 16'd4096;
            6'd51 : mask = 16'd8192;
            6'd52 : mask = 16'd16384;
            6'd53 : mask = 16'd32768;
            default : mask = 16'd0;
        endcase
        
        if (!syndrome[5]) 
        begin
            if (syndrome[4:0] == 5'd0) error = 2'd0;
            else error = 2'd2;
        end
        else 
        begin
            if (syndrome[4:3] > 0) error = 2'd3;
            else error = 2'd1;
        end
    end
    
    assign dec_out = (ecc_en) ? mask ^ dec_in : dec_in;

endmodule