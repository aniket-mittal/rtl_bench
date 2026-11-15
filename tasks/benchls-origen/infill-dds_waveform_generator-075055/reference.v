module origen_075055(
    input wire clk,
    input wire rst_n,
    input wire [3:0] keyboard_val,
    output reg [31:0] fword,
    output reg [31:0] pword,
    output reg [11:0] aword,
    output reg [3:0] wave_select,
    output reg [9:0] LED
);

    // Parameters
    parameter [31:0] fm = 32'h00010000; // Frequency step
    parameter [31:0] pm = 32'h00010000; // Phase step
    parameter [11:0] am = 12'h010;      // Amplitude step

    // Internal registers
    reg [3:0] wave_type;
    reg [31:0] freq;
    reg [31:0] phase;
    reg [11:0] ampl;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wave_type <= 4'b0000; // Sine wave
            freq <= 32'h00100000;
            phase <= 32'h00000000;
            ampl <= 12'h800;
            LED <= 10'b0000000000;
        end else begin
            case (keyboard_val)
                4'hF: begin wave_type <= 4'b0000; LED[9] <= ~LED[9]; end // Sine
                4'hE: begin wave_type <= 4'b0001; LED[8] <= ~LED[8]; end // Triangle
                4'hD: begin wave_type <= 4'b0010; LED[7] <= ~LED[7]; end // Sawtooth
                4'hC: begin wave_type <= 4'b0011; LED[6] <= ~LED[6]; end // Square
                4'hB: begin freq <= freq + fm; LED[5] <= ~LED[5]; end    // Increase frequency
                4'hA: begin freq <= freq - fm; LED[4] <= ~LED[4]; end    // Decrease frequency
                4'h9: begin phase <= phase + pm; LED[3] <= ~LED[3]; end  // Increase phase
                4'h8: begin phase <= phase - pm; LED[2] <= ~LED[2]; end  // Decrease phase
                4'h7: begin ampl <= ampl + am; LED[1] <= ~LED[1]; end    // Increase amplitude
                4'h6: begin ampl <= ampl - am; LED[0] <= ~LED[0]; end    // Decrease amplitude
                default: ; // No action
            endcase
        end
    end

    // Output assignments
    always @(*) begin
        fword = freq;
        pword = phase;
        aword = ampl;
        wave_select = wave_type;
    end

endmodule