module origen_089141(
    input wire [31:0] instruction,
    input wire clk,
    output reg [2:0] INaddr,
    output reg [2:0] OUT1addr,
    output reg [2:0] OUT2addr,
    output reg [2:0] select,
    output reg out1mux,
    output reg out2mux,
    output reg immediatemux
);

    reg [5:0] opcode;
    reg [4:0] dest, src1, src2;

    always @(posedge clk) begin
        opcode = instruction[31:26];
        dest = instruction[25:21];
        src1 = instruction[20:16];
        src2 = instruction[15:11];

        // Decode register addresses
        case (dest[2:0])
            3'b000: INaddr = 3'b000;
            3'b001: INaddr = 3'b001;
            3'b010: INaddr = 3'b010;
            3'b011: INaddr = 3'b011;
            3'b100: INaddr = 3'b100;
            3'b101: INaddr = 3'b101;
            3'b110: INaddr = 3'b110;
            3'b111: INaddr = 3'b111;
        endcase

        case (src1[2:0])
            3'b000: OUT1addr = 3'b000;
            3'b001: OUT1addr = 3'b001;
            3'b010: OUT1addr = 3'b010;
            3'b011: OUT1addr = 3'b011;
            3'b100: OUT1addr = 3'b100;
            3'b101: OUT1addr = 3'b101;
            3'b110: OUT1addr = 3'b110;
            3'b111: OUT1addr = 3'b111;
        endcase

        case (src2[2:0])
            3'b000: OUT2addr = 3'b000;
            3'b001: OUT2addr = 3'b001;
            3'b010: OUT2addr = 3'b010;
            3'b011: OUT2addr = 3'b011;
            3'b100: OUT2addr = 3'b100;
            3'b101: OUT2addr = 3'b101;
            3'b110: OUT2addr = 3'b110;
            3'b111: OUT2addr = 3'b111;
        endcase

        // Set ALU operation select
        select = opcode[2:0];

        // Set multiplexer control signals
        if (opcode == 6'h00) begin
            out1mux = 1'b0;
            out2mux = 1'b0;
            immediatemux = 1'b0;
        end else if (opcode == 6'h01 || opcode == 6'h02 || opcode == 6'h03) begin
            out1mux = 1'b0;
            out2mux = 1'b0;
            immediatemux = 1'b0;
        end else if (opcode == 6'h08) begin
            out1mux = 1'b0;
            out2mux = 1'b1;
            immediatemux = 1'b1;
        end else begin
            out1mux = 1'b0;
            out2mux = 1'b0;
            immediatemux = 1'b0;
        end
    end
endmodule

