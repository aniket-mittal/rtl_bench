module origen_059687 (
    input wire clk,
    input wire reset,
    input wire get_rdid,
    input wire spimiso,
    output reg chipsel,
    output reg spiclk,
    output reg spimosi,
    output reg get_rdid_done,
    output reg [7:0] manufacturer_id,
    output reg [7:0] memory_type,
    output reg [7:0] memory_capacity
);

    // State machine states
    localparam IDLE = 3'b000;
    localparam ASSERT_CHIPSEL = 3'b001;
    localparam SEND_INSTRUCTION = 3'b010;
    localparam GET_DATA = 3'b011;
    localparam DEASSERT_CHIPSEL = 3'b100;

    reg [2:0] state, next_state;
    reg [6:0] bit_counter;
    reg spiclk_enable;
    reg [7:0] instruction;

    // State machine
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = get_rdid ? ASSERT_CHIPSEL : IDLE;
            ASSERT_CHIPSEL: next_state = SEND_INSTRUCTION;
            SEND_INSTRUCTION: next_state = (bit_counter == 7) ? GET_DATA : SEND_INSTRUCTION;
            GET_DATA: next_state = (bit_counter == 23) ? DEASSERT_CHIPSEL : GET_DATA;
            DEASSERT_CHIPSEL: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            chipsel <= 1'b1;
            spimosi <= 1'b0;
            get_rdid_done <= 1'b0;
            manufacturer_id <= 8'b0;
            memory_type <= 8'b0;
            memory_capacity <= 8'b0;
            bit_counter <= 7'b0;
            spiclk_enable <= 1'b0;
            instruction <= 8'h9F; // RDID command
        end else begin
            case (state)
                IDLE: begin
                    chipsel <= 1'b1;
                    spimosi <= 1'b0;
                    get_rdid_done <= 1'b0;
                    bit_counter <= 7'b0;
                    spiclk_enable <= 1'b0;
                end
                ASSERT_CHIPSEL: begin
                    chipsel <= 1'b0;
                    spiclk_enable <= 1'b1;
                end
                SEND_INSTRUCTION: begin
                    spimosi <= instruction[7];
                    instruction <= {instruction[6:0], 1'b0};
                    bit_counter <= bit_counter + 1;
                end
                GET_DATA: begin
                    case (bit_counter[6:5])
                        2'b00: manufacturer_id <= {manufacturer_id[6:0], spimiso};
                        2'b01: memory_type <= {memory_type[6:0], spimiso};
                        2'b10: memory_capacity <= {memory_capacity[6:0], spimiso};
                    endcase
                    bit_counter <= bit_counter + 1;
                end
                DEASSERT_CHIPSEL: begin
                    chipsel <= 1'b1;
                    spiclk_enable <= 1'b0;
                    get_rdid_done <= 1'b1;
                end
            endcase
        end
    end

    // Generate SPI clock
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            spiclk <= 1'b0;
        end else if (spiclk_enable) begin
            spiclk <= ~spiclk;
        end else begin
            spiclk <= 1'b0;
        end
    end

endmodule