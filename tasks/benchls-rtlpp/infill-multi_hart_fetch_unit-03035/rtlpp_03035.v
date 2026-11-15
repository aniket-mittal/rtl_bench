module rtlpp_03035 (
    input wire                        clk,       
    input wire                        reset,     
    
    input  wire [31:0]                insn,      
    output wire [31:0]                if_pc,     
    input  wire                       data_rdy,  

    input  wire                       stall,     
    input  wire                       flush,     
    input  wire [31:0]                new_pc,    
    input  wire                       cache_miss,
    input  wire [3:0]                 cm_hart_id,
    input  wire [31:0]                cm_addr,        
    input  wire [3:0]                 br_hart_id,
    input  wire                       br_taken,  
    input  wire [31:0]                br_addr,   

    input  wire [3:0]                 hart_id,   
    input  wire                       id_hstart, 
    input  wire                       id_hidle,  
    input  wire [3:0]                 id_hs_id,  
    input  wire [31:0]                id_hs_pc,  

    output reg  [31:0]                pc,        
    output reg  [31:0]                if_npc,    
    output reg  [31:0]                if_insn,   
    output reg                        if_en,     
    output reg  [3:0]                 if_hart_id 
);

    reg  [31:0] if_pcs [0:15];    
    assign if_pc = if_pcs[hart_id];

    wire [31:0] npc;
    assign npc = if_pcs[hart_id] + 32'd4;

    [MASKED]

endmodule