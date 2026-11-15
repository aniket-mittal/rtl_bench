module origen_122538 #(
    parameter BUFFER_BIT_WIDTH = 4
) (
    input wire clk,
    input wire rst,
    output reg lost,

    input wire recv_reset,
    input wire [7:0] recv_data,
    input wire recv_ok,

    input wire trans_reset,
    output reg [7:0] trans_data,
    output reg trans_ok,
    input wire trans_busy,

    input wire [7:0] uart_in_data,
    input wire uart_in_valid,
    output reg uart_in_ready,

    output reg [7:0] uart_out_data,
    output reg uart_out_valid,
    input wire uart_out_ready,

    output reg [BUFFER_BIT_WIDTH:0] recv_buffer_length,
    output reg [BUFFER_BIT_WIDTH:0] trans_buffer_length
);

    localparam BUFFER_SIZE = 1 << BUFFER_BIT_WIDTH;

    // Receive buffer
    reg [7:0] recv_buffer [0:BUFFER_SIZE-1];
    reg [BUFFER_BIT_WIDTH-1:0] recv_head, recv_tail;
    wire recv_empty, recv_full;

    // Transmit buffer
    reg [7:0] trans_buffer [0:BUFFER_SIZE-1];
    reg [BUFFER_BIT_WIDTH-1:0] trans_head, trans_tail;
    wire trans_empty, trans_full;

    // Buffer status
    assign recv_empty = (recv_head == recv_tail);
    assign recv_full = ((recv_head + 1'b1) == recv_tail);
    assign trans_empty = (trans_head == trans_tail);
    assign trans_full = ((trans_head + 1'b1) == trans_tail);

    // Receive operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            recv_head <= 0;
            recv_tail <= 0;
            lost <= 0;
            recv_buffer_length <= 0;
        end else if (recv_reset) begin
            recv_head <= 0;
            recv_tail <= 0;
            lost <= 0;
            recv_buffer_length <= 0;
        end else begin
            if (recv_ok && !recv_full) begin
                recv_buffer[recv_head] <= recv_data;
                recv_head <= recv_head + 1'b1;
                recv_buffer_length <= recv_buffer_length + 1'b1;
            end
            if (uart_out_valid && uart_out_ready && !recv_empty) begin
                recv_tail <= recv_tail + 1'b1;
                recv_buffer_length <= recv_buffer_length - 1'b1;
            end
            lost <= recv_ok && recv_full;
        end
    end

    // Transmit operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            trans_head <= 0;
            trans_tail <= 0;
            trans_ok <= 0;
            trans_buffer_length <= 0;
        end else if (trans_reset) begin
            trans_head <= 0;
            trans_tail <= 0;
            trans_ok <= 0;
            trans_buffer_length <= 0;
        end else begin
            if (uart_in_valid && uart_in_ready) begin
                trans_buffer[trans_head] <= uart_in_data;
                trans_head <= trans_head + 1'b1;
                trans_buffer_length <= trans_buffer_length + 1'b1;
            end
            if (!trans_busy && !trans_empty) begin
                trans_data <= trans_buffer[trans_tail];
                trans_ok <= 1'b1;
                trans_tail <= trans_tail + 1'b1;
                trans_buffer_length <= trans_buffer_length - 1'b1;
            end else begin
                trans_ok <= 1'b0;
            end
        end
    end

    // UART interface
    always @(*) begin
        uart_in_ready = !trans_full;
        uart_out_valid = !recv_empty;
        uart_out_data = recv_buffer[recv_tail];
    end

endmodule