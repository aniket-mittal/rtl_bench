module origen_009242 (
    input [15:0] in1,
    input [15:0] in2,
    input [4:0] opcode,
    output reg [15:0] out,
    output reg [2:0] flags,
    output reg set_flags
);

    // Opcode definitions
    localparam AND  = 5'b00000;
    localparam OR   = 5'b00001;
    localparam XOR  = 5'b00010;
    localparam NOT  = 5'b00011;
    localparam ADD  = 5'b00100;
    localparam SUB  = 5'b00101;
    localparam CMP  = 5'b00110;
    localparam SHL  = 5'b00111;
    localparam SHR  = 5'b01000;
    localparam LL   = 5'b01001;
    localparam LH   = 5'b01010;

    wire [15:0] inverted_in2;
    wire [16:0] sub_result;

    assign inverted_in2 = ~in2;
    assign sub_result = {1'b0, in1} + {1'b0, inverted_in2} + 17'b1;

    always @(*) begin
        case (opcode)
            AND: out = in1 & in2;
            OR:  out = in1 | in2;
            XOR: out = in1 ^ in2;
            NOT: out = ~in1;
            ADD: out = in1 + in2;
            SUB: out = sub_result[15:0];
            CMP: out = sub_result[15:0];
            SHL: out = in1 << in2[3:0];
            SHR: out = in1 >> in2[3:0];
            LL:  out = {in1[15:8], in2[7:0]};
            LH:  out = {in2[7:0], in1[7:0]};
            default: out = in1;
        endcase

        set_flags = (opcode == CMP || opcode == ADD || opcode == SUB);

        if (set_flags) begin
            flags[2] = (sub_result[16] == 1'b0 && sub_result[15:0] != 16'b0); // P
            flags[1] = (sub_result[15:0] == 16'b0); // Z
            flags[0] = sub_result[16]; // N
        end else begin
            flags = 3'b000;
        end
    end

endmodule