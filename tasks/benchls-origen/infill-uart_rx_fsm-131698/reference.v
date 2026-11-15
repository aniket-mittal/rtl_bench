module origen_131698 (
    input wire reset,
    input wire rxd,
    output reg StringReady,
    output reg CharReady,
    input wire parity,
    output reg ready,
    output reg error,
    output reg WriteChar,
    output reg WriteString,
    output reg PossibleStart,
    input wire clk_2,
    input wire check
);

    // State encoding
    localparam IDLE = 3'b000;
    localparam POSSIBLESTART = 3'b001;
    localparam READ = 3'b010;
    localparam ERROR = 3'b011;
    localparam WRITE = 3'b100;
    localparam STOP = 3'b101;

    reg [2:0] state, next_state;
    reg [3:0] bit_count;
    reg [7:0] data_buffer;
    reg parity_calc;

    always @(posedge clk_2 or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            bit_count <= 0;
            data_buffer <= 8'b0;
            parity_calc <= 1'b0;
        end else begin
            state <= next_state;
            if (state == READ) begin
                bit_count <= bit_count + 1;
                data_buffer <= {rxd, data_buffer[7:1]};
                parity_calc <= parity_calc ^ rxd;
            end else if (state == IDLE || state == STOP) begin
                bit_count <= 0;
                parity_calc <= 1'b0;
            end
        end
    end

    always @(*) begin
        next_state = state;
        StringReady = 1'b0;
        CharReady = 1'b0;
        ready = 1'b0;
        error = 1'b0;
        WriteChar = 1'b0;
        WriteString = 1'b0;
        PossibleStart = 1'b0;

        case (state)
            IDLE: begin
                ready = 1'b1;
                if (rxd == 1'b0) begin
                    next_state = POSSIBLESTART;
                end
            end
            POSSIBLESTART: begin
                PossibleStart = 1'b1;
                if (rxd == 1'b0) begin
                    next_state = READ;
                end else begin
                    next_state = IDLE;
                end
            end
            READ: begin
                if (bit_count == 8) begin
                    next_state = ERROR;
                end
            end
            ERROR: begin
                if (check && (parity != parity_calc)) begin
                    error = 1'b1;
                    next_state = IDLE;
                end else begin
                    next_state = WRITE;
                end
            end
            WRITE: begin
                CharReady = 1'b1;
                WriteChar = 1'b1;
                if (data_buffer == 8'h0D) begin // Carriage return
                    StringReady = 1'b1;
                    WriteString = 1'b1;
                end
                next_state = STOP;
            end
            STOP: begin
                if (rxd == 1'b1) begin
                    next_state = IDLE;
                end
            end
            default: next_state = IDLE;
        endcase
    end

endmodule