// IR (Instruction Register)
module origen_058823(
    input wire [31:0] in,
    input wire signal,
    output reg [31:0] out
);
    always @(posedge signal) begin
        out <= in;
    end
endmodule

// A (Accumulator)
module A(
    input wire [31:0] in,
    output reg [31:0] out
);
    always @(*) begin
        out = in;
    end
endmodule

// PC (Program Counter)
module PC(
    input wire [31:0] in,
    input wire reset,
    input wire inc,
    input wire load,
    output reg [31:0] pc,
    output wire [31:0] npc
);
    always @(posedge reset or posedge inc or posedge load) begin
        if (reset)
            pc <= 32'h0;
        else if (inc)
            pc <= {npc[31:2], 2'b00};
        else if (load)
            pc <= {in[31:2], 2'b00};
    end
    
    assign npc = pc + 32'h4;
endmodule

// GR (General Register File)
module GR(
    input wire [4:0] addr1,
    input wire [4:0] addr2,
    input wire [4:0] inaddr,
    input wire [31:0] in,
    input wire signal,
    output wire [31:0] out1,
    output wire [31:0] out2
);
    reg [31:0] registers [31:0];

    always @(posedge signal) begin
        if (inaddr != 5'b0)
            registers[inaddr] <= in;
    end

    assign out1 = (addr1 == 5'b0) ? 32'b0 : registers[addr1];
    assign out2 = (addr2 == 5'b0) ? 32'b0 : registers[addr2];
endmodule

// IMem (Instruction Memory)
module IMem(
    input wire [31:0] addr,
    output wire [31:0] out
);
    reg [31:0] memory [1023:0];

    assign out = memory[addr[31:2]];
endmodule

// DMem (Data Memory)
module DMem(
    input wire [31:0] raddr,
    input wire [31:0] waddr,
    input wire [31:0] in,
    input wire signal,
    output wire [31:0] out
);
    reg [31:0] memory [1023:0];

    always @(posedge signal) begin
        memory[waddr[31:2]] <= in;
    end

    assign out = memory[raddr[31:2]];
endmodule

// SignExtend
module SignExtend(
    input wire [15:0] in,
    output wire [31:0] out
);
    assign out = {{16{in[15]}}, in};
endmodule

// lSignExtend (Load Sign Extend)
module lSignExtend(
    input wire [31:0] in,
    input wire [1:0] sgn,
    output reg [31:0] out
);
    always @(*) begin
        case(sgn)
            2'b00: out = {{16{in[15]}}, in[15:0]}; // Sign-extend half-word
            2'b01: out = {16'b0, in[15:0]};        // Zero-extend half-word
            2'b10: out = {{24{in[7]}}, in[7:0]};   // Sign-extend byte
            2'b11: out = {24'b0, in[7:0]};         // Zero-extend byte
        endcase
    end
endmodule

// Shift2
module Shift2(
    input wire [31:0] in,
    output wire [31:0] out
);
    assign out = {in[29:0], 2'b00};
endmodule