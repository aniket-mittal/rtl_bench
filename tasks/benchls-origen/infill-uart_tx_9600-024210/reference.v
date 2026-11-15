module origen_024210 (
    input wire clk,
    input wire rst,
    input wire trig,
    input wire [7:0] data_to_send,
    output reg tx
);

    // State encoding
    localparam IDLE  = 4'b0000;
    localparam START = 4'b0001;
    localparam ST0   = 4'b0010;
    localparam ST1   = 4'b0011;
    localparam ST2   = 4'b0100;
    localparam ST3   = 4'b0101;
    localparam ST4   = 4'b0110;
    localparam ST5   = 4'b0111;
    localparam ST6   = 4'b1000;
    localparam ST7   = 4'b1001;
    localparam STOP  = 4'b1010;

    reg [3:0] state, next_state;
    reg [12:0] counter;
    reg clk_9600;
    reg [7:0] shift_reg;

    // Clock divider for 9600 baud rate
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;
            clk_9600 <= 0;
        end else begin
            if (counter == 5208) begin
                counter <= 0;
                clk_9600 <= ~clk_9600;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // State register
    always @(posedge clk_9600 or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:  next_state = trig ? START : IDLE;
            START: next_state = ST0;
            ST0:   next_state = ST1;
            ST1:   next_state = ST2;
            ST2:   next_state = ST3;
            ST3:   next_state = ST4;
            ST4:   next_state = ST5;
            ST5:   next_state = ST6;
            ST6:   next_state = ST7;
            ST7:   next_state = STOP;
            STOP:  next_state = trig ? START : IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk_9600 or posedge rst) begin
        if (rst) begin
            tx <= 1'b1;
            shift_reg <= 8'b0;
        end else begin
            case (state)
                IDLE: begin
                    tx <= 1'b1;
                    if (trig) shift_reg <= data_to_send;
                end
                START: tx <= 1'b0;
                ST0: tx <= shift_reg[0];
                ST1: tx <= shift_reg[1];
                ST2: tx <= shift_reg[2];
                ST3: tx <= shift_reg[3];
                ST4: tx <= shift_reg[4];
                ST5: tx <= shift_reg[5];
                ST6: tx <= shift_reg[6];
                ST7: tx <= shift_reg[7];
                STOP: tx <= 1'b1;
                default: tx <= 1'b1;
            endcase
        end
    end

endmodule