module origen_028348 (
    input wire clk,
    input wire key,
    input wire fd,
    output reg fs
);

    parameter TIME_CNT = 500000;
    parameter TIME = 500000;

    reg [3:0] state;
    reg [31:0] cnt;
    reg last_key;

    localparam IDLE = 4'h0;
    localparam PREP = 4'h1;
    localparam WORK = 4'h2;

    always @(posedge clk) begin
        last_key <= key;
    end

    always @(posedge clk) begin
        case (state)
            IDLE: begin
                if (key == 1'b0 && last_key == 1'b1) begin
                    state <= PREP;
                end
                cnt <= 32'd0;
                fs <= 1'b0;
            end

            PREP: begin
                if (key == 1'b1 && last_key == 1'b0) begin
                    state <= WORK;
                end
                cnt <= 32'd0;
                fs <= 1'b0;
            end

            WORK: begin
                if (fd == 1'b1 || cnt == TIME) begin
                    state <= IDLE;
                    cnt <= 32'd0;
                    fs <= 1'b0;
                end else begin
                    cnt <= cnt + 1'b1;
                    fs <= 1'b1;
                end
            end

            default: state <= IDLE;
        endcase
    end

endmodule