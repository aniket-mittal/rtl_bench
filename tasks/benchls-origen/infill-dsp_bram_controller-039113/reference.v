module origen_039113 (
    input wire clk,
    input wire [31:0] inst,
    input wire [31:0] BRAM0,
    input wire [31:0] BRAM1,
    output reg [9:0] bram0_addr,
    output reg [9:0] bram1_addr,
    output reg [3:0] bram1_we,
    output wire bram1_en,
    output wire [4:0] dsp_inmode,
    output wire [6:0] dsp_opmode,
    output wire [3:0] dsp_alumode,
    output reg [31:0] BRAM1_in
);

    reg [2:0] counter;

    // Counter logic
    always @(posedge clk) begin
        if (counter == 3'd4 && inst[31]) begin
            counter <= 3'd0;
        end else begin
            counter <= counter + 1;
        end
    end

    // BRAM0 addressing
    always @(*) begin
        bram0_addr = {5'b0, inst[4:0]};
    end

    // BRAM1 addressing and write enable
    always @(*) begin
        if (counter == 3'd4 && inst[31]) begin
            bram1_addr = {5'b0, inst[14:10]};
            bram1_we = 4'b1111;
        end else begin
            bram1_addr = {5'b0, inst[9:5]};
            bram1_we = 4'b0000;
        end
    end

    // BRAM1 input data
    always @(*) begin
        BRAM1_in = BRAM0; // Assuming BRAM1 input comes from BRAM0
    end

    // DSP control signals
    assign dsp_inmode = inst[19:15];
    assign dsp_opmode = inst[26:20];
    assign dsp_alumode = inst[30:27];

    // BRAM1 always enabled
    assign bram1_en = 1'b1;

endmodule