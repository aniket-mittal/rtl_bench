module rtlpp_02285(
    input wire clk,
    input wire [7:0] addr,
    output reg [15:0] dout
);

always @(posedge clk) begin
    case(addr)
        0:  dout <= 16'h1280; 
        1:  dout <= 16'hFFF0; 
        2:  dout <= 16'h1204; 
        3:  dout <= 16'h1180; 
        4:  dout <= 16'h0C00; 
        5:  dout <= 16'h3E00; 
        6:  dout <= 16'h0400; 
        7:  dout <= 16'h40C0; 
        8:  dout <= 16'h3A04; 
        9:  dout <= 16'h1418; 
        10: dout <= 16'h4FB3; 
        11: dout <= 16'h50B3; 
        12: dout <= 16'h5100; 
        13: dout <= 16'h523D; 
        14: dout <= 16'h53A7; 
        15: dout <= 16'h54E4; 
        16: dout <= 16'h589E; 
        17: dout <= 16'h3DC0; 
        18: dout <= 16'h1714; 
        19: dout <= 16'h1802; 
        20: dout <= 16'h8C02;
        21: dout <= 16'h1903; 
        22: dout <= 16'h1A7B; 
        23: dout <= 16'h030A; 
        24: dout <= 16'h0F41; 
        25: dout <= 16'h1E00; 
        26: dout <= 16'h330B; 
        27: dout <= 16'h3C78; 
        28: dout <= 16'h6900; 
        29: dout <= 16'h7400; 
        30: dout <= 16'hB084; 
        31: dout <= 16'hB10C; 
        32: dout <= 16'hB20E; 
        33: dout <= 16'hB380; 
        34: dout <= 16'h3280; 
        35: dout <= 16'h703A;
        36: dout <= 16'h7135;
        37: dout <= 16'h7211;
        38: dout <= 16'h73F0;
        39: dout <= 16'hA202;
        40: dout <= 16'h7A20;
        41: dout <= 16'h7B10;
        42: dout <= 16'h7C1E;
        43: dout <= 16'h7D35;
        44: dout <= 16'h7E5A;
        45: dout <= 16'h7F69;
        46: dout <= 16'h8076;
        47: dout <= 16'h8180;
        48: dout <= 16'h8288;
        49: dout <= 16'h838F;
        50: dout <= 16'h8496;
        51: dout <= 16'h85A3;
        52: dout <= 16'h86AF;
        53: dout <= 16'h87C4;
        54: dout <= 16'h88D7;
        55: dout <= 16'h89E8;
        56: dout <= 16'h13E0; 
        57: dout <= 16'h0000; 
        58: dout <= 16'h1000; 
        59: dout <= 16'h0D40; 
        60: dout <= 16'h1418; 
        61: dout <= 16'hA505; 
        62: dout <= 16'hAB07; 
        63: dout <= 16'h2495; 
        64: dout <= 16'h2533; 
        65: dout <= 16'h26E3; 
        66: dout <= 16'h9F78; 
        67: dout <= 16'hA068; 
        68: dout <= 16'hA103; 
        69: dout <= 16'hA6D8; 
        70: dout <= 16'hA7D8; 
        71: dout <= 16'hA8F0; 
        72: dout <= 16'hA990; 
        73: dout <= 16'hAA94; 
        74: dout <= 16'h13E7;
        default: dout <= 16'hFFFF;         
    endcase 
end

endmodule