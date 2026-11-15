// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 73;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_091787 dut (
    .clock(clk),
    .reset(in_vec[72:72]),
    .des_register(in_vec[71:67]),
    .writeEnable(in_vec[66:66]),
    .mux_3_sel(in_vec[65:65]),
    .ALUout(in_vec[64:33]),
    .dmem_out(in_vec[32:1]),
    .Insthit(in_vec[0:0]),
    .des_register_out(out_vec[71:67]),
    .writeEnable_out(out_vec[66:66]),
    .mux_3_sel_out(out_vec[65:65]),
    .ALUout_out(out_vec[64:33]),
    .dmem_out_out(out_vec[32:1]),
    .Insthit_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 73'h1950c75ae07fed4aebb;
    stim[1] = 73'h147dfe91580aa289530;
    stim[2] = 73'h0b26b04c8d6c09a2a3f;
    stim[3] = 73'h0b2be1a3afc91bdabab;
    stim[4] = 73'h0eea2d62ffd3c0c5192;
    stim[5] = 73'h0ffe35eb35ad43caf93;
    stim[6] = 73'h1f392ec69ce02047129;
    stim[7] = 73'h0c43f14e437e99acb4b;
    stim[8] = 73'h0f6a2a954d33a799923;
    stim[9] = 73'h019bb4114e8cd9444df;
    stim[10] = 73'h138e0ba5959f476b3f7;
    stim[11] = 73'h0302ce3348394475da5;
    stim[12] = 73'h0afecc976d51a6702c8;
    stim[13] = 73'h0a7e64c548f2dfa4bf7;
    stim[14] = 73'h04252651f092295c266;
    stim[15] = 73'h024be019c19fe7220a3;
    stim[16] = 73'h07fd9c67128268ce65f;
    stim[17] = 73'h08cd808bcc181eb1f95;
    stim[18] = 73'h004ef878d004c8f65b4;
    stim[19] = 73'h0f19460a0394e0d15ab;
    stim[20] = 73'h019f0584c898915d730;
    stim[21] = 73'h03e1b24acaeee0a4b81;
    stim[22] = 73'h0732327ff454575e514;
    stim[23] = 73'h0676c43884f2abd06b4;
    stim[24] = 73'h0efc72682a4fd733e1c;
    stim[25] = 73'h0d11132f46835881734;
    stim[26] = 73'h0d9f632f9d7a5164c27;
    stim[27] = 73'h0aa8e7c22a5a1e365c8;
    stim[28] = 73'h0b82e8f2c3a2c061609;
    stim[29] = 73'h0b3396a51a992ff09cb;
    stim[30] = 73'h0aba77da3b9ac002b53;
    stim[31] = 73'h05524a6cf76cb3ad3a2;
    stim[32] = 73'h07368fe05c124cea848;
    stim[33] = 73'h0ee9e06f1a5e6749e05;
    stim[34] = 73'h0d894e4cb2f9acc9cd0;
    stim[35] = 73'h02db92b1f26d5770632;
    stim[36] = 73'h0e7163410a7bfd5914c;
    stim[37] = 73'h0e44b03f71a36420b39;
    stim[38] = 73'h045814ba62ac47bd6e6;
    stim[39] = 73'h02e062df9d474e1df20;
    stim[40] = 73'h0cd8d7249e93831c466;
    stim[41] = 73'h00c40fb38608915b25a;
    stim[42] = 73'h0d681d1d7218ae41586;
    stim[43] = 73'h08f7d0778163b21bb6d;
    stim[44] = 73'h0c1aa6cadd566bce276;
    stim[45] = 73'h0ba85bad4c7aa2ef86a;
    stim[46] = 73'h08dee036354f6b5a366;
    stim[47] = 73'h07500a284aa662dcbf4;
    stim[48] = 73'h07c6eefcca9d6b9ec2f;
    stim[49] = 73'h0b8f2fb8ebdde823b51;
    stim[50] = 73'h0ae060f0395c04512f1;
    stim[51] = 73'h08a0a030273c9770418;
    stim[52] = 73'h08bc5fcbadc0ca1e2ee;
    stim[53] = 73'h0e779ca28b8445fdf13;
    stim[54] = 73'h06274d058bf1cabeb70;
    stim[55] = 73'h0fc97dc3b52a936d4cb;
    stim[56] = 73'h0f6db4433139b9444fb;
    stim[57] = 73'h0545b54abe219a19502;
    stim[58] = 73'h0aebf96376fcb4e8e90;
    stim[59] = 73'h00707d5e70ade6dee44;
    stim[60] = 73'h0647bdb838b021bb223;
    stim[61] = 73'h09d0daac8dcd8d03b0f;
    stim[62] = 73'h0659d135b227226fa36;
    stim[63] = 73'h00b81e611f116c3d5cc;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 72'h950c75ae07fed4aebb;
      expv[2] = 72'h47dfe91580aa289530;
      expv[3] = 72'hb26b04c8d6c09a2a3f;
      expv[4] = 72'hb2be1a3afc91bdabab;
      expv[5] = 72'heea2d62ffd3c0c5192;
      expv[6] = 72'hffe35eb35ad43caf93;
      expv[7] = 72'hf392ec69ce02047129;
      expv[8] = 72'hc43f14e437e99acb4b;
      expv[9] = 72'hf6a2a954d33a799923;
      expv[10] = 72'h19bb4114e8cd9444df;
      expv[11] = 72'h38e0ba5959f476b3f7;
      expv[12] = 72'h302ce3348394475da5;
      expv[13] = 72'hafecc976d51a6702c8;
      expv[14] = 72'ha7e64c548f2dfa4bf7;
      expv[15] = 72'h4252651f092295c266;
      expv[16] = 72'h24be019c19fe7220a3;
      expv[17] = 72'h7fd9c67128268ce65f;
      expv[18] = 72'h8cd808bcc181eb1f95;
      expv[19] = 72'h04ef878d004c8f65b4;
      expv[20] = 72'hf19460a0394e0d15ab;
      expv[21] = 72'h19f0584c898915d730;
      expv[22] = 72'h3e1b24acaeee0a4b81;
      expv[23] = 72'h732327ff454575e514;
      expv[24] = 72'h676c43884f2abd06b4;
      expv[25] = 72'hefc72682a4fd733e1c;
      expv[26] = 72'hd11132f46835881734;
      expv[27] = 72'hd9f632f9d7a5164c27;
      expv[28] = 72'haa8e7c22a5a1e365c8;
      expv[29] = 72'hb82e8f2c3a2c061609;
      expv[30] = 72'hb3396a51a992ff09cb;
      expv[31] = 72'haba77da3b9ac002b53;
      expv[32] = 72'h5524a6cf76cb3ad3a2;
      expv[33] = 72'h7368fe05c124cea848;
      expv[34] = 72'hee9e06f1a5e6749e05;
      expv[35] = 72'hd894e4cb2f9acc9cd0;
      expv[36] = 72'h2db92b1f26d5770632;
      expv[37] = 72'he7163410a7bfd5914c;
      expv[38] = 72'he44b03f71a36420b39;
      expv[39] = 72'h45814ba62ac47bd6e6;
      expv[40] = 72'h2e062df9d474e1df20;
      expv[41] = 72'hcd8d7249e93831c466;
      expv[42] = 72'h0c40fb38608915b25a;
      expv[43] = 72'hd681d1d7218ae41586;
      expv[44] = 72'h8f7d0778163b21bb6d;
      expv[45] = 72'hc1aa6cadd566bce276;
      expv[46] = 72'hba85bad4c7aa2ef86a;
      expv[47] = 72'h8dee036354f6b5a366;
      expv[48] = 72'h7500a284aa662dcbf4;
      expv[49] = 72'h7c6eefcca9d6b9ec2f;
      expv[50] = 72'hb8f2fb8ebdde823b51;
      expv[51] = 72'hae060f0395c04512f1;
      expv[52] = 72'h8a0a030273c9770418;
      expv[53] = 72'h8bc5fcbadc0ca1e2ee;
      expv[54] = 72'he779ca28b8445fdf13;
      expv[55] = 72'h6274d058bf1cabeb70;
      expv[56] = 72'hfc97dc3b52a936d4cb;
      expv[57] = 72'hf6db4433139b9444fb;
      expv[58] = 72'h545b54abe219a19502;
      expv[59] = 72'haebf96376fcb4e8e90;
      expv[60] = 72'h0707d5e70ade6dee44;
      expv[61] = 72'h647bdb838b021bb223;
      expv[62] = 72'h9d0daac8dcd8d03b0f;
      expv[63] = 72'h659d135b227226fa36;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
