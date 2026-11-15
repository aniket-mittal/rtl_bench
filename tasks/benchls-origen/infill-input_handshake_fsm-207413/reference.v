module origen_207413(
    input           clk,
    input           rst,
    input           input_rdy,
    output reg      input_acc,
    output reg      ld_reg,
    output reg      inc,
    output reg      start,
    output reg      icc,
    input           outsent
);

    reg [2:0] state;
    reg [1:0] cnt;

    localparam IDLE         = 3'd0;
    localparam RDY          = 3'd1;
    localparam GET_DATA     = 3'd2;
    localparam WAIT_FOR_INPUT_RDY = 3'd3;
    localparam WAIT_FOR_BUFFER = 3'd4;
    localparam START        = 3'd5;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            cnt <= 2'd0;
            input_acc <= 1'b0;
            ld_reg <= 1'b0;
            inc <= 1'b0;
            start <= 1'b0;
            icc <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (input_rdy) begin
                        state <= RDY;
                        input_acc <= 1'b1;
                    end else begin
                        input_acc <= 1'b0;
                    end
                    ld_reg <= 1'b0;
                    inc <= 1'b0;
                    start <= 1'b0;
                    icc <= 1'b0;
                end
                RDY: begin
                    state <= GET_DATA;
                    input_acc <= 1'b0;
                    ld_reg <= 1'b1;
                    inc <= 1'b1;
                    start <= 1'b0;
                    icc <= 1'b1;
                end
                GET_DATA: begin
                    if (cnt == 2'd2) begin
                        state <= WAIT_FOR_INPUT_RDY;
                        ld_reg <= 1'b0;
                        inc <= 1'b0;
                    end else begin
                        cnt <= cnt + 2'd1;
                        ld_reg <= 1'b1;
                        inc <= 1'b1;
                    end
                    input_acc <= 1'b0;
                    start <= 1'b0;
                    icc <= 1'b1;
                end
                WAIT_FOR_INPUT_RDY: begin
                    if (!input_rdy) begin
                        state <= WAIT_FOR_BUFFER;
                        cnt <= 2'd0;
                    end
                    input_acc <= 1'b0;
                    ld_reg <= 1'b0;
                    inc <= 1'b0;
                    start <= 1'b0;
                    icc <= 1'b0;
                end
                WAIT_FOR_BUFFER: begin
                    if (outsent) begin
                        state <= START;
                    end
                    input_acc <= 1'b0;
                    ld_reg <= 1'b0;
                    inc <= 1'b0;
                    start <= 1'b0;
                    icc <= 1'b0;
                end
                START: begin
                    state <= IDLE;
                    input_acc <= 1'b0;
                    ld_reg <= 1'b0;
                    inc <= 1'b0;
                    start <= 1'b1;
                    icc <= 1'b0;
                end
            endcase
        end
    end

endmodule