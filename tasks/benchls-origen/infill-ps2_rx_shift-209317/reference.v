module origen_209317(
    input clk,
    input reset,
    input start_receiving,
    input ps2_clk,
    input ps2_dat,
    output reg [7:0] command,
    output reg received
);

reg [2:0] clk_div;
reg process_cmd;
reg [3:0] counter;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        clk_div <= 3'h7;
        counter <= 4'b0;
        command <= 8'b0;
        process_cmd <= 1'b0;
        received <= 1'b0;
    end
    else begin
        if (start_receiving) begin
            process_cmd <= 1'b1;
        end
        if (process_cmd) begin
            if (clk_div == 3'h0) begin
                clk_div <= 3'h7;
                if (counter == 4'b1011) begin
                    process_cmd <= 1'b0;
                    received <= 1'b1;
                end
                else begin
                    command <= {command[6:0], ps2_dat};
                    counter <= counter + 1'b1;
                end
            end
            else begin
                clk_div <= clk_div - 1'b1;
            end
        end
        else begin
            received <= 1'b0;
        end
    end
end

assign ps2_clk = process_cmd ? 1'b0 : 1'bz;
assign ps2_dat = process_cmd ? 1'b0 : 1'bz;

endmodule