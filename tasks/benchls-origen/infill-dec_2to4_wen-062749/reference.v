module origen_062749(
    input [1:0] data,
    input wen,
    output reg [3:0] dec
);
    always @(*) begin
        if (wen)
            dec = 4'b0001 << data;
        else
            dec = 4'b0000;
    end
endmodule

module Dec3to8(
    input [2:0] data,
    input wen,
    output [7:0] dec
);
    wire [3:0] dec_low, dec_high;
    
    Dec2to4 low_decoder(
        .data(data[1:0]),
        .wen(wen & ~data[2]),
        .dec(dec_low)
    );
    
    Dec2to4 high_decoder(
        .data(data[1:0]),
        .wen(wen & data[2]),
        .dec(dec_high)
    );
    
    assign dec = {dec_high, dec_low};
endmodule

module Dec4to16(
    input [3:0] data,
    input wen,
    output [15:0] dec
);
    wire [7:0] dec_low, dec_high;
    
    Dec3to8 low_decoder(
        .data(data[2:0]),
        .wen(wen & ~data[3]),
        .dec(dec_low)
    );
    
    Dec3to8 high_decoder(
        .data(data[2:0]),
        .wen(wen & data[3]),
        .dec(dec_high)
    );
    
    assign dec = {dec_high, dec_low};
endmodule

module Dec5to32(
    input [4:0] data,
    input wen,
    output [31:0] dec
);
    wire [15:0] dec_low, dec_high;
    
    Dec4to16 low_decoder(
        .data(data[3:0]),
        .wen(wen & ~data[4]),
        .dec(dec_low)
    );
    
    Dec4to16 high_decoder(
        .data(data[3:0]),
        .wen(wen & data[4]),
        .dec(dec_high)
    );
    
    assign dec = {dec_high, dec_low};
endmodule

module Dec6to64(
    input [5:0] data,
    input wen,
    output [63:0] dec
);
    wire [31:0] dec_low, dec_high;
    
    Dec5to32 low_decoder(
        .data(data[4:0]),
        .wen(wen & ~data[5]),
        .dec(dec_low)
    );
    
    Dec5to32 high_decoder(
        .data(data[4:0]),
        .wen(wen & data[5]),
        .dec(dec_high)
    );
    
    assign dec = {dec_high, dec_low};
endmodule

module Dec7to128(
    input [6:0] data,
    output [127:0] dec
);
    wire [63:0] dec_low, dec_high;
    
    Dec6to64 low_decoder(
        .data(data[5:0]),
        .wen(~data[6]),
        .dec(dec_low)
    );
    
    Dec6to64 high_decoder(
        .data(data[5:0]),
        .wen(data[6]),
        .dec(dec_high)
    );
    
    assign dec = {dec_high, dec_low};
endmodule