module origen_142745(
    input [15:0] in,
    input [3:0] shift,
    output reg [15:0] out
);
    always @(*) begin
        case(shift)
            4'b0000: out = in;
            4'b0001: out = {in[0], in[15:1]};
            4'b0010: out = {in[1:0], in[15:2]};
            4'b0011: out = {in[2:0], in[15:3]};
            4'b0100: out = {in[3:0], in[15:4]};
            4'b0101: out = {in[4:0], in[15:5]};
            4'b0110: out = {in[5:0], in[15:6]};
            4'b0111: out = {in[6:0], in[15:7]};
            4'b1000: out = {in[7:0], in[15:8]};
            4'b1001: out = {in[8:0], in[15:9]};
            4'b1010: out = {in[9:0], in[15:10]};
            4'b1011: out = {in[10:0], in[15:11]};
            4'b1100: out = {in[11:0], in[15:12]};
            4'b1101: out = {in[12:0], in[15:13]};
            4'b1110: out = {in[13:0], in[15:14]};
            4'b1111: out = {in[14:0], in[15]};
        endcase
    end
endmodule

module binary_to_bcd(
    input [3:0] D3, D2, D1, D0,
    output reg [3:0] B3, B2, B1, B0
);
    reg [15:0] bcd;
    integer i;
    
    always @(*) begin
        bcd = {12'b0, D3, D2, D1, D0};
        for (i = 0; i < 12; i = i + 1) begin
            if (bcd[15:12] > 4)
                bcd[15:12] = bcd[15:12] + 3;
            if (bcd[11:8] > 4)
                bcd[11:8] = bcd[11:8] + 3;
            if (bcd[7:4] > 4)
                bcd[7:4] = bcd[7:4] + 3;
            bcd = {bcd[14:0], 1'b0};
        end
        B3 = bcd[15:12];
        B2 = bcd[11:8];
        B1 = bcd[7:4];
        B0 = bcd[3:0];
    end
endmodule

module input_selector(
    input [15:0] shifted_value,
    input [3:0] shift,
    output reg [3:0] D3, D2, D1, D0
);
    always @(*) begin
        case(shift)
            4'b0000: {D3, D2, D1, D0} = shifted_value[15:12];
            4'b0001: {D3, D2, D1, D0} = shifted_value[14:11];
            4'b0010: {D3, D2, D1, D0} = shifted_value[13:10];
            4'b0011: {D3, D2, D1, D0} = shifted_value[12:9];
            4'b0100: {D3, D2, D1, D0} = shifted_value[11:8];
            4'b0101: {D3, D2, D1, D0} = shifted_value[10:7];
            4'b0110: {D3, D2, D1, D0} = shifted_value[9:6];
            4'b0111: {D3, D2, D1, D0} = shifted_value[8:5];
            4'b1000: {D3, D2, D1, D0} = shifted_value[7:4];
            4'b1001: {D3, D2, D1, D0} = shifted_value[6:3];
            4'b1010: {D3, D2, D1, D0} = shifted_value[5:2];
            4'b1011: {D3, D2, D1, D0} = shifted_value[4:1];
            4'b1100: {D3, D2, D1, D0} = shifted_value[3:0];
            default: {D3, D2, D1, D0} = shifted_value[15:12];
        endcase
    end
endmodule

module combined_system(
    input [15:0] in,
    input [3:0] shift,
    output [3:0] B3, B2, B1, B0
);
    wire [15:0] shifted_value;
    wire [3:0] D3, D2, D1, D0;

    barrel_shifter bs(
        .in(in),
        .shift(shift),
        .out(shifted_value)
    );

    input_selector is(
        .shifted_value(shifted_value),
        .shift(shift),
        .D3(D3),
        .D2(D2),
        .D1(D1),
        .D0(D0)
    );

    binary_to_bcd btb(
        .D3(D3),
        .D2(D2),
        .D1(D1),
        .D0(D0),
        .B3(B3),
        .B2(B2),
        .B1(B1),
        .B0(B0)
    );
endmodule