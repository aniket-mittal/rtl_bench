module rtlpp_00988 (
    input wire clk,
    input wire reset,
    input wire sample_clk_en,
    input wire [3:0] op_num,          
    input wire [21:0] phase_acc,
    input wire [21:0] phase_acc_17,
    input wire [21:0] phase_acc_13,
    input wire [2:0] op_type,    
    output reg [21:0] rhythm_phase
);	
    localparam RAND_POLYNOMIAL = 'h800302; 
    localparam RAND_NUM_WIDTH = 24;
    localparam OP_HI_HAT = 3'b000;
    localparam OP_SNARE_DRUM = 3'b001;
    localparam OP_TOP_CYMBAL = 3'b010;
    localparam OP_NORMAL = 3'b011;
    localparam OP_BASS_DRUM = 3'b100;
    localparam OP_TOM_TOM = 3'b101;
    
    reg [11:0] friend_phase;
    wire [11:0] phase_bit;
    wire [11:0] upper_current_phase;
    reg [11:0] noise_bit;    
    reg [RAND_NUM_WIDTH-1:0] rand_num = 1;
    
    assign upper_current_phase = phase_acc >> 10;
    
    always @ *
        case (op_type)
        OP_HI_HAT:     friend_phase = phase_acc_17 >> 10;
        OP_TOP_CYMBAL: friend_phase = phase_acc_13 >> 10;
        default:        friend_phase = 0;
        endcase
            
    assign
        phase_bit = (((upper_current_phase & 'h88) ^ ((upper_current_phase << 5) & 'h80)) |
         ((friend_phase ^ (friend_phase << 2)) & 'h20)) ? 'h02 : 'h00;
     
    always @ *
        case (op_type)
        OP_HI_HAT:     noise_bit = rand_num[0] << 1;
        OP_SNARE_DRUM: noise_bit = rand_num[0] << 8;
        default:        noise_bit = 0;
        endcase
    
    always @ *
        case (op_type)
        OP_NORMAL:     rhythm_phase = phase_acc;
        OP_BASS_DRUM:  rhythm_phase = phase_acc;
        OP_HI_HAT:     rhythm_phase = ((phase_bit << 8) | ('h34 << (phase_bit ^ noise_bit))) << 10;
        OP_TOM_TOM:    rhythm_phase = phase_acc;
        OP_SNARE_DRUM: rhythm_phase = (('h100 + (upper_current_phase & 'h100)) ^ noise_bit) << 10;
        OP_TOP_CYMBAL: rhythm_phase = ((1 + phase_bit) << 8) << 10;
        default:        rhythm_phase = phase_acc;
        endcase
            
    always @(posedge clk)
        
        if (reset)
            rand_num <= 1;
        else if (sample_clk_en && op_num == 0)
            if (rand_num & 1)
                rand_num <= (rand_num ^ RAND_POLYNOMIAL) >> 1;
            else
                rand_num <= rand_num >> 1;  
endmodule