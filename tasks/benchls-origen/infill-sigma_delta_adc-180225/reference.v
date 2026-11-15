module origen_180225(
    input clk,
    input rst,
    input [4:0] divider,
    input difpin,
    output reg refout,
    output reg [15:0] adcval,
    output reg valid
);

reg [4:0] divctr;
reg [15:0] accumulator;
reg [8:0] counter;
reg first_after_reset;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        refout <= 1'b0;
        adcval <= 16'b0;
        valid <= 1'b0;
        first_after_reset <= 1'b1;
        counter <= 9'd1;
        accumulator <= 16'b0;
    end
    else begin
        if (divctr >= divider) begin
            divctr <= 5'b0;
            refout <= difpin;
            counter <= counter + 1'b1;

            if (counter == 9'd0) begin
                if (first_after_reset) begin
                    first_after_reset <= 1'b0;
                end
                else begin
                    adcval <= accumulator;
                    valid <= 1'b1;
                end
            end
            else begin
                if (~difpin) begin
                    accumulator <= accumulator + 16'b1;
                end
            end
        end
        else begin
            divctr <= divctr + 5'b1;
            valid <= 1'b0;
        end
    end
end

endmodule