module origen_029945 (
    input wire clk_1MHz,
    input wire en,
    input wire reset,
    input wire MISO,
    output reg CS,
    output reg [7:0] disp
);

    reg [4:0] counter_16;
    reg [15:0] shift_reg;

    localparam IDLE = 2'b00;
    localparam ACTIVE = 2'b01;
    localparam COMPLETE = 2'b10;

    reg [1:0] state;

    always @(posedge clk_1MHz or posedge reset) begin
        if (reset) begin
            counter_16 <= 5'b0;
            CS <= 1'b1;
            disp <= 8'b0;
            shift_reg <= 16'b0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (en && counter_16 == 5'b0) begin
                        CS <= 1'b0;
                        state <= ACTIVE;
                        counter_16 <= counter_16 + 1;
                    end
                end

                ACTIVE: begin
                    shift_reg <= {shift_reg[14:0], MISO};
                    counter_16 <= counter_16 + 1;
                    if (counter_16 == 5'd14) begin
                        state <= COMPLETE;
                    end
                end

                COMPLETE: begin
                    CS <= 1'b1;
                    disp <= shift_reg[11:4];
                    counter_16 <= 5'b0;
                    state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule