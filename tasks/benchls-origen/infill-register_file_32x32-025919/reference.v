module origen_025919 (
    input wire clock,
    input wire reset,
    input wire [4:0] addra,
    input wire [4:0] addrb,
    input wire [4:0] addrc,
    input wire [31:0] datac,
    input wire enc,
    output reg [31:0] dataa,
    output reg [31:0] datab,
    output wire [31:0] ass_dataa,
    output wire [31:0] ass_datab,
    output wire [31:0] regout$0,
    output wire [31:0] regout$1,
    output wire [31:0] regout$2,
    output wire [31:0] regout$3,
    output wire [31:0] regout$4
);

    reg [31:0] registers [0:31];

    // Asynchronous read
    assign ass_dataa = registers[addra];
    assign ass_datab = registers[addrb];

    // Direct access to first five registers
    assign regout$0 = registers[0];
    assign regout$1 = registers[1];
    assign regout$2 = registers[2];
    assign regout$3 = registers[3];
    assign regout$4 = registers[4];

    integer i;
    always @(posedge clock or negedge reset) begin
        if (!reset) begin
            // Asynchronous reset
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
            dataa <= 32'b0;
            datab <= 32'b0;
        end else begin
            // Synchronous read
            dataa <= registers[addra];
            datab <= registers[addrb];

            // Synchronous write
            if (enc) begin
                registers[addrc] <= datac;
            end
        end
    end

endmodule