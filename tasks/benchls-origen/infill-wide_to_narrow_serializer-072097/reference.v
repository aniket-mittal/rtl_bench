module origen_072097 #(
    parameter INPUT_DATA_WIDTH = 512,
    parameter OUTPUT_DATA_WIDTH = 16
) (
    input wire clk,
    input wire en,
    input wire rst,
    input wire available_read,
    output reg request_read,
    input wire data_valid,
    input wire [INPUT_DATA_WIDTH-1:0] read_data,
    input wire pop_data,
    output reg available_pop,
    output reg [OUTPUT_DATA_WIDTH-1:0] data_out
);

    localparam BUFFER_SIZE = INPUT_DATA_WIDTH;
    localparam OUTPUT_CHUNKS = INPUT_DATA_WIDTH / OUTPUT_DATA_WIDTH;

    reg [1:0] read_state, next_read_state;
    reg [1:0] control_state, next_control_state;
    reg [BUFFER_SIZE-1:0] buffer;
    reg [$clog2(OUTPUT_CHUNKS):0] chunk_counter;
    reg buffer_full;

    // Read FSM
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            read_state <= 2'b00;
        end else if (en) begin
            read_state <= next_read_state;
        end
    end

    always @(*) begin
        next_read_state = read_state;
        case (read_state)
            2'b00: if (available_read && !buffer_full) next_read_state = 2'b01;
            2'b01: next_read_state = 2'b10;
            2'b10: if (data_valid) next_read_state = 2'b00;
            default: next_read_state = 2'b00;
        endcase
    end

    // Control FSM
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            control_state <= 2'b00;
        end else if (en) begin
            control_state <= next_control_state;
        end
    end

    always @(*) begin
        next_control_state = control_state;
        case (control_state)
            2'b00: if (buffer_full) next_control_state = 2'b01;
            2'b01: if (chunk_counter == 0 && pop_data) next_control_state = 2'b00;
            default: next_control_state = 2'b00;
        endcase
    end

    // Buffer and output control
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            buffer <= {BUFFER_SIZE{1'b0}};
            buffer_full <= 1'b0;
            chunk_counter <= 0;
            request_read <= 1'b0;
            available_pop <= 1'b0;
            data_out <= {OUTPUT_DATA_WIDTH{1'b0}};
        end else if (en) begin
            case (read_state)
                2'b01: request_read <= 1'b1;
                2'b10: if (data_valid) begin
                    buffer <= read_data;
                    buffer_full <= 1'b1;
                    request_read <= 1'b0;
                end
                default: request_read <= 1'b0;
            endcase

            case (control_state)
                2'b01: begin
                    if (pop_data) begin
                        data_out <= buffer[BUFFER_SIZE-1:BUFFER_SIZE-OUTPUT_DATA_WIDTH];
                        buffer <= {buffer[BUFFER_SIZE-OUTPUT_DATA_WIDTH-1:0], {OUTPUT_DATA_WIDTH{1'b0}}};
                        if (chunk_counter == 0) begin
                            chunk_counter <= OUTPUT_CHUNKS - 1;
                            buffer_full <= 1'b0;
                        end else begin
                            chunk_counter <= chunk_counter - 1;
                        end
                    end
                    available_pop <= 1'b1;
                end
                default: begin
                    available_pop <= 1'b0;
                    data_out <= {OUTPUT_DATA_WIDTH{1'b0}};
                end
            endcase
        end
    end

endmodule