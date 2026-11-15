module origen_145855 (
    input wire clk,
    input wire reset,
    input wire run,
    input wire [7:0] wrSize,
    input wire [7:0] config_data,
    input wire validIn,
    input wire [7:0] dataIn,
    input wire busy,
    input wire arm,
    output reg send,
    output reg [7:0] memoryWrData,
    output reg memoryRead,
    output reg memoryWrite,
    output reg memoryLastWrite
);

    // FSM states
    localparam IDLE = 3'd0;
    localparam SAMPLE = 3'd1;
    localparam DELAY = 3'd2;
    localparam READ = 3'd3;
    localparam READWAIT = 3'd4;

    reg [2:0] state, next_state;
    reg [7:0] fwd, bwd;
    reg [7:0] delay_counter, read_counter;
    reg [7:0] write_counter;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:
                if (run)
                    next_state = DELAY;
                else if (arm)
                    next_state = SAMPLE;
            SAMPLE:
                if (run)
                    next_state = DELAY;
            DELAY:
                if (delay_counter == 0)
                    next_state = READ;
            READ:
                if (read_counter == 0)
                    next_state = READWAIT;
            READWAIT:
                if (!busy)
                    next_state = READ;
                else if (read_counter == 0)
                    next_state = IDLE;
        endcase
    end

    // Config registers
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            fwd <= 8'd0;
            bwd <= 8'd0;
        end else if (state == IDLE) begin
            if (wrSize == 8'd0)
                fwd <= config_data;
            else if (wrSize == 8'd1)
                bwd <= config_data;
        end
    end

    // Counters
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            delay_counter <= 8'd0;
            read_counter <= 8'd0;
            write_counter <= 8'd0;
        end else begin
            case (state)
                IDLE: begin
                    delay_counter <= fwd;
                    read_counter <= bwd;
                    write_counter <= 8'd0;
                end
                SAMPLE:
                    if (validIn)
                        write_counter <= write_counter + 1'b1;
                DELAY:
                    if (delay_counter > 0)
                        delay_counter <= delay_counter - 1'b1;
                READ:
                    if (read_counter > 0)
                        read_counter <= read_counter - 1'b1;
                READWAIT:
                    if (!busy && read_counter > 0)
                        read_counter <= read_counter - 1'b1;
            endcase
        end
    end

    // Output logic
    always @(*) begin
        send = 1'b0;
        memoryWrData = 8'd0;
        memoryRead = 1'b0;
        memoryWrite = 1'b0;
        memoryLastWrite = 1'b0;

        case (state)
            SAMPLE: begin
                if (validIn) begin
                    memoryWrData = dataIn;
                    memoryWrite = 1'b1;
                    memoryLastWrite = (write_counter == wrSize - 1);
                end
            end
            READ: begin
                memoryRead = 1'b1;
                send = 1'b1;
            end
        endcase
    end

endmodule