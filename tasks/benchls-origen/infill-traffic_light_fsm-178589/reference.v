module origen_178589(
    input clk,
    input rstn,
    input HS,
    input FS,
    output reg H_RED,
    output reg H_YELLOW,
    output reg H_LEFT,
    output reg H_GREEN,
    output reg F_RED,
    output reg F_YELLOW,
    output reg F_LEFT
);

    reg [2:0] c_state, n_state;
    reg [3:0] timer;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            c_state <= 3'd0;
            timer <= 4'd0;
        end
        else begin
            c_state <= n_state;
            timer <= (c_state == n_state) ? timer + 1'b1 : 4'd0;
        end
    end

    always @(*) begin
        case (c_state)
            3'd0: begin
                H_RED = 1'b1;
                H_YELLOW = 1'b0;
                H_LEFT = 1'b0;
                H_GREEN = 1'b1;
                F_RED = 1'b1;
                F_YELLOW = 1'b0;
                F_LEFT = 1'b0;
                n_state = (HS | FS) ? 3'd1 : 3'd0;
            end
            3'd1: begin
                H_RED = 1'b1;
                H_YELLOW = 1'b0;
                H_LEFT = 1'b0;
                H_GREEN = 1'b0;
                F_RED = 1'b1;
                F_YELLOW = 1'b0;
                F_LEFT = 1'b0;
                n_state = HS ? 3'd2 : 3'd3;
            end
            3'd2: begin
                H_RED = 1'b0;
                H_YELLOW = 1'b1;
                H_LEFT = 1'b0;
                H_GREEN = 1'b0;
                F_RED = 1'b1;
                F_YELLOW = 1'b0;
                F_LEFT = 1'b0;
                n_state = (timer == 4'd4) ? 3'd4 : 3'd2;
            end
            3'd3: begin
                H_RED = 1'b1;
                H_YELLOW = 1'b0;
                H_LEFT = 1'b0;
                H_GREEN = 1'b0;
                F_RED = 1'b1;
                F_YELLOW = 1'b0;
                F_LEFT = 1'b0;
                n_state = (timer == 4'd4) ? 3'd5 : 3'd3;
            end
            3'd4: begin
                H_RED = 1'b0;
                H_YELLOW = 1'b0;
                H_LEFT = 1'b1;
                H_GREEN = 1'b1;
                F_RED = 1'b1;
                F_YELLOW = 1'b0;
                F_LEFT = 1'b0;
                n_state = FS ? 3'd3 : 3'd6;
            end
            3'd5: begin
                H_RED = 1'b1;
                H_YELLOW = 1'b0;
                H_LEFT = 1'b0;
                H_GREEN = 1'b0;
                F_RED = 1'b0;
                F_YELLOW = 1'b1;
                F_LEFT = 1'b0;
                n_state = 3'd0;
            end
            3'd6: begin
                H_RED = 1'b0;
                H_YELLOW = 1'b0;
                H_LEFT = 1'b0;
                H_GREEN = 1'b1;
                F_RED = 1'b1;
                F_YELLOW = 1'b0;
                F_LEFT = 1'b0;
                n_state = 3'd0;
            end
            default: begin
                H_RED = 1'b1;
                H_YELLOW = 1'b0;
                H_LEFT = 1'b0;
                H_GREEN = 1'b0;
                F_RED = 1'b1;
                F_YELLOW = 1'b0;
                F_LEFT = 1'b0;
                n_state = 3'd0;
            end
        endcase
    end

endmodule