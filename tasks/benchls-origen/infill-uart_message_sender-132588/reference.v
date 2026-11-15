module origen_132588 (
    input wire clk,
    input wire rst,
    output reg [7:0] tx_data,
    output reg new_tx_data,
    input wire tx_busy,
    input wire [7:0] rx_data,
    input wire new_rx_data
);

    // States
    localparam IDLE = 2'b00;
    localparam WAIT_FIRST = 2'b01;
    localparam PRINT_MESSAGE = 2'b10;
    localparam END = 2'b11;

    reg [1:0] state, next_state;
    reg [7:0] message_addr;
    wire [7:0] message_data;

    // Message ROM instantiation
    message_rom rom (
        .clk(clk),
        .addr(message_addr),
        .data(message_data)
    );

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = new_rx_data ? WAIT_FIRST : IDLE;
            WAIT_FIRST: next_state = tx_busy ? WAIT_FIRST : PRINT_MESSAGE;
            PRINT_MESSAGE: next_state = (message_data == 8'h00) ? END : (tx_busy ? PRINT_MESSAGE : PRINT_MESSAGE);
            END: next_state = tx_busy ? END : IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx_data <= 8'h00;
            new_tx_data <= 1'b0;
            message_addr <= 8'h00;
        end else begin
            case (state)
                IDLE: begin
                    if (new_rx_data) begin
                        message_addr <= rx_data;
                        new_tx_data <= 1'b0;
                    end
                end
                WAIT_FIRST: begin
                    if (!tx_busy) begin
                        tx_data <= message_data;
                        new_tx_data <= 1'b1;
                        message_addr <= message_addr + 1;
                    end
                end
                PRINT_MESSAGE: begin
                    if (!tx_busy) begin
                        if (message_data == 8'h00) begin
                            new_tx_data <= 1'b0;
                        end else begin
                            tx_data <= message_data;
                            new_tx_data <= 1'b1;
                            message_addr <= message_addr + 1;
                        end
                    end else begin
                        new_tx_data <= 1'b0;
                    end
                end
                END: begin
                    if (!tx_busy) begin
                        tx_data <= 8'h0A; // Newline character
                        new_tx_data <= 1'b1;
                    end else begin
                        new_tx_data <= 1'b0;
                    end
                end
            endcase
        end
    end

endmodule

module message_rom (
    input wire clk,
    input wire [7:0] addr,
    output reg [7:0] data
);

    reg [7:0] rom [0:255];

    initial begin
        // Initialize ROM with messages (example)
        rom[0] = "H";
        rom[1] = "e";
        rom[2] = "l";
        rom[3] = "l";
        rom[4] = "o";
        rom[5] = 8'h00; // End of message
        // Add more messages as needed
    end

    always @(posedge clk) begin
        data <= rom[addr];
    end

endmodule