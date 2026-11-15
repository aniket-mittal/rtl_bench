module origen_172591 (
    input clk,
    input reset_n,
    input start,
    output reg move_en,
    output reg load_coord,
    output reg datapath_en,
    output reg plot,
    output reg reset_n_out,
    output reg [1:0] op
);

    // States
    localparam S_START = 3'b000;
    localparam S_START_WAIT = 3'b001;
    localparam S_RESET = 3'b010;
    localparam S_ERASE = 3'b011;
    localparam S_WAIT = 3'b100;
    localparam S_CHECK_OVER = 3'b101;
    localparam S_GAME_OVER = 3'b110;
    localparam S_DRAW = 3'b111;
    localparam S_LOAD_COORD = 4'b1000;

    reg [3:0] state;
    reg done;
    reg go;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= S_START;
            done <= 0;
            go <= 0;
            move_en <= 0;
            load_coord <= 0;
            datapath_en <= 0;
            plot <= 0;
            reset_n_out <= 0;
            op <= 0;
        end else begin
            case (state)
                S_START: begin
                    if (start) begin
                        state <= S_START_WAIT;
                    end
                end

                S_START_WAIT: begin
                    state <= S_RESET;
                end

                S_RESET: begin
                    reset_n_out <= 1;
                    state <= S_ERASE;
                end

                S_ERASE: begin
                    op <= 2'b01;
                    move_en <= 1;
                    datapath_en <= 1;
                    plot <= 1;
                    if (done) begin
                        plot <= 0;
                        state <= S_WAIT;
                    end
                end

                S_WAIT: begin
                    move_en <= 0;
                    datapath_en <= 0;
                    if (go) begin
                        state <= S_CHECK_OVER;
                    end
                end

                S_CHECK_OVER: begin
                    if (done) begin
                        state <= S_GAME_OVER;
                    end else begin
                        state <= S_LOAD_COORD;
                    end
                end

                S_GAME_OVER: begin
                    // Handle game over state
                end

                S_LOAD_COORD: begin
                    load_coord <= 1;
                    state <= S_DRAW;
                end

                S_DRAW: begin
                    load_coord <= 0;
                    op <= 2'b00;
                    move_en <= 1;
                    datapath_en <= 1;
                    plot <= 1;
                    if (done) begin
                        plot <= 0;
                        state <= S_WAIT;
                        go <= 1;
                    end
                end

                default: begin
                    state <= S_START;
                end
            endcase
        end
    end

endmodule