module origen_116074 (
    input wire a5_or_c3,
    input wire data_ena,
    input wire clk_50,
    input wire reset_n,
    output reg wr_fifo
);

    // State definitions
    localparam [1:0] not_detect = 2'b00, detect = 2'b01;
    localparam [1:0] check = 2'b00, temp = 2'b01;
    localparam [2:0] header = 3'b000, data_0 = 3'b001, data_1 = 3'b010, data_2 = 3'b011, data_3 = 3'b100;
    localparam [1:0] not_write = 2'b00, write = 2'b01;

    // State registers
    reg [1:0] detect_ps, detect_ns;
    reg [1:0] packet_type_ps, packet_type_ns;
    reg [2:0] data_type_ps, data_type_ns;
    reg [1:0] write_ps, write_ns;

    // Internal signals
    reg byte_assembled;

    // State machine: Detect
    always @(posedge clk_50 or negedge reset_n) begin
        if (!reset_n)
            detect_ps <= not_detect;
        else
            detect_ps <= detect_ns;
    end

    always @(*) begin
        case (detect_ps)
            not_detect: detect_ns = data_ena ? detect : not_detect;
            detect: detect_ns = data_ena ? detect : not_detect;
            default: detect_ns = not_detect;
        endcase
    end

    // State machine: Packet Type
    always @(posedge clk_50 or negedge reset_n) begin
        if (!reset_n)
            packet_type_ps <= check;
        else
            packet_type_ps <= packet_type_ns;
    end

    always @(*) begin
        case (packet_type_ps)
            check: packet_type_ns = (data_type_ps == header && a5_or_c3) ? temp : check;
            temp: packet_type_ns = (data_type_ps == header) ? check : temp;
            default: packet_type_ns = check;
        endcase
    end

    // State machine: Data Type
    always @(posedge clk_50 or negedge reset_n) begin
        if (!reset_n)
            data_type_ps <= header;
        else
            data_type_ps <= data_type_ns;
    end

    always @(*) begin
        if (byte_assembled) begin
            case (data_type_ps)
                header: data_type_ns = data_0;
                data_0: data_type_ns = data_1;
                data_1: data_type_ns = data_2;
                data_2: data_type_ns = data_3;
                data_3: data_type_ns = header;
                default: data_type_ns = header;
            endcase
        end else begin
            data_type_ns = data_type_ps;
        end
    end

    // State machine: Write
    always @(posedge clk_50 or negedge reset_n) begin
        if (!reset_n)
            write_ps <= not_write;
        else
            write_ps <= write_ns;
    end

    always @(*) begin
        case (write_ps)
            not_write: write_ns = (data_type_ps != header && packet_type_ps == temp && byte_assembled) ? write : not_write;
            write: write_ns = not_write;
            default: write_ns = not_write;
        endcase
    end

    // Output logic
    always @(posedge clk_50 or negedge reset_n) begin
        if (!reset_n)
            wr_fifo <= 1'b0;
        else
            wr_fifo <= (write_ps == write);
    end

    // Byte assembled logic (simplified for this example)
    always @(posedge clk_50 or negedge reset_n) begin
        if (!reset_n)
            byte_assembled <= 1'b0;
        else
            byte_assembled <= data_ena; // Simplified: assumes data_ena indicates a byte is assembled
    end

endmodule