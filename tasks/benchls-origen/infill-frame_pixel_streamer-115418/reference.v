module origen_115418 (
    input wire clk,
    input wire reset,
    input wire [7:0] pixel_i,
    input wire sw,
    output reg read_request,
    output reg write_request,
    output reg finished,
    output reg [7:0] pixel_o
);

    // Parameters
    localparam DELAY_MAX = 100;
    localparam READ_MAX = 640 * 480;

    // State definitions
    localparam DELAY = 2'b00;
    localparam GO = 2'b01;
    localparam STOP = 2'b10;

    // Registers
    reg [1:0] state, next_state;
    reg [7:0] delay_counter;
    reg [19:0] read_counter;
    reg [7:0] pixel_buffer [2:0];

    // State machine
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= DELAY;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            DELAY: next_state = (delay_counter == DELAY_MAX - 1) ? GO : DELAY;
            GO: next_state = (read_counter == READ_MAX - 1) ? STOP : GO;
            STOP: next_state = (delay_counter == DELAY_MAX - 1) ? DELAY : STOP;
            default: next_state = DELAY;
        endcase
    end

    // Delay counter
    always @(posedge clk or posedge reset) begin
        if (reset)
            delay_counter <= 8'd0;
        else if (state == DELAY || state == STOP)
            delay_counter <= delay_counter + 8'd1;
        else
            delay_counter <= 8'd0;
    end

    // Read counter
    always @(posedge clk or posedge reset) begin
        if (reset)
            read_counter <= 20'd0;
        else if (state == GO)
            read_counter <= read_counter + 20'd1;
        else
            read_counter <= 20'd0;
    end

    // Pixel buffer
    always @(posedge clk) begin
        if (state == GO) begin
            pixel_buffer[2] <= pixel_buffer[1];
            pixel_buffer[1] <= pixel_buffer[0];
            pixel_buffer[0] <= pixel_i;
        end
    end

    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            read_request <= 1'b0;
            write_request <= 1'b0;
            finished <= 1'b0;
            pixel_o <= 8'd0;
        end else begin
            case (state)
                DELAY: begin
                    read_request <= 1'b0;
                    write_request <= 1'b0;
                    finished <= 1'b0;
                end
                GO: begin
                    read_request <= 1'b1;
                    write_request <= 1'b1;
                    finished <= 1'b0;
                    if (sw)
                        pixel_o <= (pixel_buffer[2] > pixel_buffer[0]) ? 
                                   ((pixel_buffer[2] - pixel_buffer[0] > 255) ? 8'd255 : pixel_buffer[2] - pixel_buffer[0]) :
                                   8'd0;
                    else
                        pixel_o <= pixel_buffer[1];
                end
                STOP: begin
                    read_request <= 1'b0;
                    write_request <= 1'b0;
                    finished <= (delay_counter == DELAY_MAX - 1);
                end
            endcase
        end
    end

endmodule