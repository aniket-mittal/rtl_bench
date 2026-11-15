module origen_115981 (
    input wire clk,
    input wire rst_n,
    input wire wrt,
    input wire MISO,
    input wire [15:0] cmd,
    output reg done,
    output reg SS_n,
    output wire MOSI,
    output wire SCLK,
    output reg [15:0] rd_data
);

    // State encoding
    localparam IDLE = 2'b00;
    localparam FRONT = 2'b01;
    localparam SHIFT = 2'b10;
    localparam BACK = 2'b11;

    reg [1:0] state, nxt_state;
    reg [4:0] sclk_div;
    reg [15:0] shft_reg;
    reg [4:0] count;
    reg MISO_smpl;
    wire smpl, shft;

    // SCLK generation
    assign SCLK = sclk_div[4];

    // Sampling and shifting signals
    assign smpl = (sclk_div == 5'b01111);
    assign shft = (sclk_div == 5'b11111);

    // MOSI output
    assign MOSI = shft_reg[15];

    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= nxt_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: nxt_state = wrt ? FRONT : IDLE;
            FRONT: nxt_state = SHIFT;
            SHIFT: nxt_state = (count == 5'b10000 && shft) ? BACK : SHIFT;
            BACK: nxt_state = IDLE;
            default: nxt_state = IDLE;
        endcase
    end

    // SCLK divider
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            sclk_div <= 5'b0;
        else if (state == IDLE)
            sclk_div <= 5'b0;
        else
            sclk_div <= sclk_div + 1'b1;
    end

    // Shift register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            shft_reg <= 16'b0;
        else if (state == IDLE && wrt)
            shft_reg <= cmd;
        else if (state == SHIFT && shft)
            shft_reg <= {shft_reg[14:0], MISO_smpl};
    end

    // MISO sampling
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            MISO_smpl <= 1'b0;
        else if (smpl)
            MISO_smpl <= MISO;
    end

    // Bit counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 5'b0;
        else if (state == IDLE)
            count <= 5'b0;
        else if (state == SHIFT && smpl)
            count <= count + 1'b1;
    end

    // Control signals
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            SS_n <= 1'b1;
            done <= 1'b0;
            rd_data <= 16'b0;
        end else begin
            case (state)
                IDLE: begin
                    SS_n <= 1'b1;
                    done <= 1'b0;
                end
                FRONT: SS_n <= 1'b0;
                BACK: begin
                    SS_n <= 1'b1;
                    done <= 1'b1;
                    rd_data <= shft_reg;
                end
            endcase
        end
    end

endmodule