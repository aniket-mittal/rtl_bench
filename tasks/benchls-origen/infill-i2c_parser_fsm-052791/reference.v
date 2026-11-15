module origen_052791 (
    input wire CLK,
    input wire RST,
    input wire I2C_START,
    input wire MT,
    input wire [3:0] N_BYTES,
    input wire READ,
    input wire READY,
    output reg CLR_START,
    output reg EXECUTE,
    output reg LD_ADDR,
    output reg LD_DEV,
    output reg LD_N_BYTE,
    output reg NVIO_ENA,
    output reg READ_FF,
    output reg WRT_ENA,
    output reg [3:0] I2C_PARSER_STATE
);

    // State definitions
    localparam [3:0] 
        Idle        = 4'b0000,
        Clr_Start   = 4'b0001,
        Execute_I2C = 4'b0010,
        Load_Addr   = 4'b0011,
        Load_Dev    = 4'b0100,
        Load_N_Byte = 4'b0101,
        Wait_4_Cmplt= 4'b0110,
        Wait_4_Ready= 4'b0111,
        Wrt_2_Mem   = 4'b1000;

    reg [3:0] state, next_state;
    reg [3:0] bcnt;

    // State register
    always @(posedge CLK or posedge RST) begin
        if (RST)
            state <= Idle;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        next_state = state;
        case (state)
            Idle: 
                if (I2C_START && !MT) next_state = Load_Dev;
            Load_Dev: 
                next_state = Load_Addr;
            Load_Addr:
                if (N_BYTES == 4'b0000 && READ)
                    next_state = Load_N_Byte;
                else if (N_BYTES == 4'b0000 && !READ)
                    next_state = Clr_Start;
                else
                    next_state = Execute_I2C;
            Execute_I2C:
                next_state = Wait_4_Cmplt;
            Wait_4_Cmplt:
                if (READY) next_state = Wait_4_Ready;
            Wait_4_Ready:
                if (!READY) next_state = Wrt_2_Mem;
            Wrt_2_Mem:
                if (bcnt == N_BYTES - 1) next_state = Clr_Start;
                else next_state = Wait_4_Cmplt;
            Clr_Start:
                next_state = Idle;
            Load_N_Byte:
                next_state = Execute_I2C;
            default:
                next_state = Idle;
        endcase
    end

    // Output logic
    always @(*) begin
        CLR_START = (next_state == Clr_Start);
        EXECUTE = (next_state == Execute_I2C);
        LD_ADDR = (next_state == Load_Addr);
        LD_DEV = (next_state == Load_Dev);
        LD_N_BYTE = (next_state == Load_N_Byte);
        NVIO_ENA = (next_state == Wrt_2_Mem);
        READ_FF = (state == Load_Addr && READ);
        WRT_ENA = (next_state == Wrt_2_Mem);
        I2C_PARSER_STATE = state;
    end

    // Byte counter
    always @(posedge CLK or posedge RST) begin
        if (RST)
            bcnt <= 4'b0000;
        else if (state == Idle)
            bcnt <= 4'b0000;
        else if (state == Wrt_2_Mem)
            bcnt <= bcnt + 1;
    end

    // Simulation-only state name display
    `ifdef SIMULATION
    reg [8*20:1] state_name;
    always @(*) begin
        case (state)
            Idle:        state_name = "Idle";
            Clr_Start:   state_name = "Clr_Start";
            Execute_I2C: state_name = "Execute_I2C";
            Load_Addr:   state_name = "Load_Addr";
            Load_Dev:    state_name = "Load_Dev";
            Load_N_Byte: state_name = "Load_N_Byte";
            Wait_4_Cmplt:state_name = "Wait_4_Cmplt";
            Wait_4_Ready:state_name = "Wait_4_Ready";
            Wrt_2_Mem:   state_name = "Wrt_2_Mem";
            default:     state_name = "Unknown";
        endcase
    end
    `endif

endmodule