module origen_027088 (
    input wire clk_a,
    input wire clk_b,
    input wire reset,
    input wire [3:0] addr_a,
    input wire [3:0] addr_b,
    input wire [3:0] din_a,
    input wire we_n_a,
    output reg [3:0] dout_a,
    output reg [3:0] dout_b
);

    reg [3:0] ram [0:15];
    reg [3:0] d_a, d_b;

    // Port A: Read and Write
    always @(posedge clk_a or posedge reset) begin
        if (reset) begin
            d_a <= 4'b0000;
        end else begin
            if (!we_n_a) begin
                ram[addr_a] <= din_a;
            end
            d_a <= ram[addr_a];
        end
    end

    // Port B: Read only
    always @(posedge clk_b or posedge reset) begin
        if (reset) begin
            d_b <= 4'b0000;
        end else begin
            d_b <= ram[addr_b];
        end
    end

    // Output assignments
    always @(*) begin
        dout_a = d_a;
        dout_b = d_b;
    end

    // Initialize RAM for simulation
    `ifdef SIMULATION
        integer i;
        initial begin
            for (i = 0; i < 16; i = i + 1) begin
                ram[i] = 4'b0000;
            end
        end
    `endif

endmodule