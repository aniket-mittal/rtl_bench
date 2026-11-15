module origen_172349(
    input ck,
    input reset,
    input hz512,
    input [3:0] dig4, dig3, dig2, dig1, dig0,
    input [4:0] dispen,
    output reg [4:0] common,
    output reg [6:0] segment
);

reg [3:0] cnt;
reg [4:0] ring;

always @(posedge ck, posedge reset) begin
    if (reset)
        cnt <= 0;
    else
        cnt <= cnt + 1;
end

always @* begin
    ring = {cnt == 4'd4, cnt == 4'd3, cnt == 4'd2, cnt == 4'd1, ~|cnt};
end

always @* begin
    common = ring & dispen;
end

function [6:0] segdec;
    input [3:0] digit;
    case (digit)
        4'h0: segdec = 7'b1000000;
        4'h1: segdec = 7'b1111001;
        4'h2: segdec = 7'b0100100;
        4'h3: segdec = 7'b0110000;
        4'h4: segdec = 7'b0011001;
        4'h5: segdec = 7'b0010010;
        4'h6: segdec = 7'b0000010;
        4'h7: segdec = 7'b1111000;
        4'h8: segdec = 7'b0000000;
        4'h9: segdec = 7'b0010000;
        default: segdec = 7'b1111111;
    endcase
endfunction

always @* begin
    case (cnt)
        4'd0: segment = segdec(dig0);
        4'd1: segment = segdec(dig1);
        4'd2: segment = segdec(dig2);
        4'd3: segment = segdec(dig3);
        4'd4: segment = segdec(dig4);
        default: segment = 7'b1111111;
    endcase
end

endmodule