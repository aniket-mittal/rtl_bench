module origen_045770 #(
    parameter OSC_DIV = 1,
    parameter CHECKALWAYS = 0,
    parameter AUTORECONFIG = 0,
    parameter BOOT_OPTION = 0,
    parameter MCCLK_FREQ = 100,
    parameter DEV_DENSITY = 25
) (
    input wire SEDENABLE,
    input wire SEDSTART,
    input wire SEDFRCERRN,
    output reg SEDERR,
    output reg SEDDONE,
    output reg SEDINPROG,
    output wire SEDCLKOUT
);

    // Internal signals
    reg [31:0] count;
    reg [31:0] sed_count;
    reg clkout;
    reg [2:0] state;

    // State definitions
    localparam IDLE = 3'b000;
    localparam IN_PROGRESS = 3'b001;
    localparam DONE = 3'b010;

    // Calculate SED operation duration based on device density
    always @(*) begin
        case (DEV_DENSITY)
            25: sed_count = 32'd2500000;
            40: sed_count = 32'd4000000;
            100: sed_count = 32'd10000000;
            default: sed_count = 32'd2500000;
        endcase
    end

    // Clock generation
    reg [31:0] clk_counter;
    always @(posedge clkout or negedge SEDENABLE) begin
        if (!SEDENABLE) begin
            clk_counter <= 0;
            clkout <= 0;
        end else begin
            if (clk_counter == (MCCLK_FREQ * OSC_DIV / 2) - 1) begin
                clk_counter <= 0;
                clkout <= ~clkout;
            end else begin
                clk_counter <= clk_counter + 1;
            end
        end
    end

    // Main state machine
    always @(posedge clkout or negedge SEDENABLE) begin
        if (!SEDENABLE) begin
            state <= IDLE;
            count <= 0;
            SEDDONE <= 0;
            SEDINPROG <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (SEDSTART) begin
                        state <= IN_PROGRESS;
                        SEDINPROG <= 1;
                        count <= 0;
                    end
                end
                IN_PROGRESS: begin
                    if (count == sed_count - 1) begin
                        state <= DONE;
                        SEDINPROG <= 0;
                        SEDDONE <= 1;
                    end else begin
                        count <= count + 1;
                    end
                end
                DONE: begin
                    state <= IDLE;
                    SEDDONE <= 0;
                end
                default: state <= IDLE;
            endcase
        end
    end

    // Error handling
    always @(*) begin
        SEDERR = SEDENABLE & ~SEDFRCERRN;
    end

    // Clock output
    assign SEDCLKOUT = SEDENABLE ? clkout : 1'b0;

endmodule