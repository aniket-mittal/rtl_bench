module origen_116527 (
    input wire clk50m,
    input wire rst_n,
    input wire crc_start,
    output reg [9:0] mem_addr_out,
    output reg crc_en,
    output reg crc_rdy
);

    // State encoding
    localparam IDLE = 3'd0,
               FETCH_DATA = 3'd1,
               WAIT = 3'd2,
               PROCESS_CRC = 3'd3,
               DONE = 3'd4;

    reg [2:0] current_state, next_state;
    reg [9:0] cnt;

    // State register
    always @(posedge clk50m or negedge rst_n) begin
        if (!rst_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE:        next_state = crc_start ? FETCH_DATA : IDLE;
            FETCH_DATA:  next_state = WAIT;
            WAIT:        next_state = PROCESS_CRC;
            PROCESS_CRC: next_state = (cnt == 10'd1023) ? DONE : FETCH_DATA;
            DONE:        next_state = crc_start ? FETCH_DATA : DONE;
            default:     next_state = IDLE;
        endcase
    end

    // Counter logic
    always @(posedge clk50m or negedge rst_n) begin
        if (!rst_n)
            cnt <= 10'd0;
        else if (current_state == IDLE || current_state == DONE)
            cnt <= 10'd0;
        else if (current_state == PROCESS_CRC)
            cnt <= cnt + 10'd1;
    end

    // Output logic
    always @(*) begin
        mem_addr_out = cnt;
        crc_en = (current_state == PROCESS_CRC);
        crc_rdy = (current_state == DONE);
    end

endmodule