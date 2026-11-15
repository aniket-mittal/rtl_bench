module origen_099141 (
    input wire clk,
    input wire enter,
    input wire [7:0] B,
    output reg [1:0] sr_sel,
    output reg acc_ld,
    output reg acc_clr,
    output reg done
);

    // State encoding
    localparam [3:0] 
        HOLD  = 4'b0000,
        START = 4'b0001,
        BIT0  = 4'b0010,
        BIT1  = 4'b0011,
        BIT2  = 4'b0100,
        BIT3  = 4'b0101,
        BIT4  = 4'b0110,
        BIT5  = 4'b0111,
        BIT6  = 4'b1000,
        BIT7  = 4'b1001,
        DONE  = 4'b1010;

    reg [3:0] current_state, next_state;

    // State register
    always @(posedge clk) begin
        current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            HOLD:  next_state = enter ? START : HOLD;
            START: next_state = BIT0;
            BIT0:  next_state = BIT1;
            BIT1:  next_state = BIT2;
            BIT2:  next_state = BIT3;
            BIT3:  next_state = BIT4;
            BIT4:  next_state = BIT5;
            BIT5:  next_state = BIT6;
            BIT6:  next_state = BIT7;
            BIT7:  next_state = DONE;
            DONE:  next_state = HOLD;
            default: next_state = HOLD;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default output values
        sr_sel = 2'b00;
        acc_ld = 1'b0;
        acc_clr = 1'b0;
        done = 1'b0;

        case (current_state)
            START: begin
                sr_sel = 2'b01;
                acc_clr = 1'b1;
            end
            BIT0: begin
                sr_sel = 2'b10;
                acc_ld = B[0];
            end
            BIT1: begin
                sr_sel = 2'b10;
                acc_ld = B[1];
            end
            BIT2: begin
                sr_sel = 2'b10;
                acc_ld = B[2];
            end
            BIT3: begin
                sr_sel = 2'b10;
                acc_ld = B[3];
            end
            BIT4: begin
                sr_sel = 2'b10;
                acc_ld = B[4];
            end
            BIT5: begin
                sr_sel = 2'b10;
                acc_ld = B[5];
            end
            BIT6: begin
                sr_sel = 2'b10;
                acc_ld = B[6];
            end
            BIT7: begin
                sr_sel = 2'b10;
                acc_ld = B[7];
            end
            DONE: begin
                done = 1'b1;
            end
        endcase
    end

endmodule