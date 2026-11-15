module origen_043969 (
    input wire clk,
    input wire [3:0] st,
    input wire [4:0] in_cell_row,
    output reg [4:0] in_addr,
    output reg [7:0] w_addr
);

    // Parameters
    parameter IDLE = 4'b0001;
    parameter LOAD_W = 4'b0010;
    parameter CALCULATION = 4'b0100;
    parameter DONE = 4'b1000;
    parameter FILTER_WEIGHT = 5'd25;

    // Internal registers
    reg [4:0] wait_change;

    // Address generation logic
    always @(posedge clk) begin
        case (st)
            IDLE: begin
                in_addr <= 5'd0;
                w_addr <= 8'd0;
                wait_change <= 5'd1;
            end

            LOAD_W: begin
                if (w_addr < 8'd156) begin
                    w_addr <= w_addr + 8'd1;
                end
                if (in_addr < FILTER_WEIGHT - 1) begin
                    in_addr <= in_addr + 5'd1;
                end
            end

            CALCULATION: begin
                w_addr <= 8'd0;
                if (in_cell_row == 5'd28) begin
                    in_addr <= in_addr;
                end else if (wait_change == 5'd27) begin
                    in_addr <= in_addr + 5'd1;
                    wait_change <= 5'd1;
                end else begin
                    wait_change <= wait_change + 5'd1;
                end
            end

            default: begin // DONE or any other state
                in_addr <= 5'd0;
                w_addr <= 8'd0;
                wait_change <= 5'd1;
            end
        endcase
    end

endmodule