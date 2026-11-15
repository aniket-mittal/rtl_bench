// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 148;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_008903 dut (
    .i_clk(clk),
    .i_rst(in_vec[65:65]),
    .i_BI_en(in_vec[64:64]),
    .i_rom_data(in_vec[63:0]),
    .o_rom_addr(out_vec[147:138]),
    .o_m0_addr(out_vec[137:134]),
    .o_m0_data(out_vec[133:70]),
    .o_m0_w_en(out_vec[69:69]),
    .o_m1_addr(out_vec[68:65]),
    .o_m1_data(out_vec[64:1]),
    .o_m1_w_en(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h3e5a71a723cbee07e;
    stim[1] = 66'h318f4d9ddcd211458;
    stim[2] = 66'h119eed562f6822ca1;
    stim[3] = 66'h01c9fec98637e0d7e;
    stim[4] = 66'h082b4119aaa30bca4;
    stim[5] = 66'h11ce37eb2e53fa482;
    stim[6] = 66'h0ed713e218ff02404;
    stim[7] = 66'h08edddaa0ae846e3b;
    stim[8] = 66'h0f49c4e783dffa92a;
    stim[9] = 66'h17450b08ffe7d5075;
    stim[10] = 66'h18c3c91eeba99018e;
    stim[11] = 66'h0bc2d81b2ab187426;
    stim[12] = 66'h1c5038f7be8fefbd3;
    stim[13] = 66'h16e10f0591bcb68c1;
    stim[14] = 66'h0024fd4290517092e;
    stim[15] = 66'h0c270258e1be1c9de;
    stim[16] = 66'h00f9ed4657d040cdc;
    stim[17] = 66'h10b842000afbafecf;
    stim[18] = 66'h1e1522bfa1c3a507c;
    stim[19] = 66'h0f92883f30af17160;
    stim[20] = 66'h0b4fc9254825279f1;
    stim[21] = 66'h1e9a2ce22ee012e29;
    stim[22] = 66'h18a1106f1ac91ccfb;
    stim[23] = 66'h02444b2d1f51f43a8;
    stim[24] = 66'h0dc90acca4992af15;
    stim[25] = 66'h1808807b89cd3a0f1;
    stim[26] = 66'h08f1f660bb0ece2e4;
    stim[27] = 66'h1ad08fff14a5d9a80;
    stim[28] = 66'h0d86f978346210bc3;
    stim[29] = 66'h0839172c617451900;
    stim[30] = 66'h1a715d801a89c6b35;
    stim[31] = 66'h02cdc88014e2e8622;
    stim[32] = 66'h0229f0a8aa685a21e;
    stim[33] = 66'h0d91786a8b6ad52b0;
    stim[34] = 66'h12bd60827dbfffa38;
    stim[35] = 66'h11d9394e2a87c49ff;
    stim[36] = 66'h08c0aaf79bad5030f;
    stim[37] = 66'h0b816959ed78d2b44;
    stim[38] = 66'h16269e9abf43e3248;
    stim[39] = 66'h07841365d728e52c8;
    stim[40] = 66'h189d5e80bab7c12a6;
    stim[41] = 66'h023e347cd1a127377;
    stim[42] = 66'h1851d1898fe4fc789;
    stim[43] = 66'h0631fd710a90a3959;
    stim[44] = 66'h10d7c21554cb2c6b4;
    stim[45] = 66'h1f92f80df8a0e39c5;
    stim[46] = 66'h1935baaabc800511f;
    stim[47] = 66'h19d4dc0bade5e0de1;
    stim[48] = 66'h0f0c94e21bc7f14a5;
    stim[49] = 66'h0d331dbdd19b56090;
    stim[50] = 66'h0b220956c3bb4a4a2;
    stim[51] = 66'h0053b0f549350c79b;
    stim[52] = 66'h01d0d3bb699afaa66;
    stim[53] = 66'h29428c32f994909f7;
    stim[54] = 66'h183e479053fbb2847;
    stim[55] = 66'h113f778ecd176096e;
    stim[56] = 66'h00d80fb1ab2887543;
    stim[57] = 66'h04df7a8cc8bfe60f2;
    stim[58] = 66'h00aa1b8dc3aa77882;
    stim[59] = 66'h16e8e0c150adc2889;
    stim[60] = 66'h07618c974925b161a;
    stim[61] = 66'h07b425d4d1d280a03;
    stim[62] = 66'h054120758b8c00f6c;
    stim[63] = 66'h0cb13f3b82a38c8ea;
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
      expv[0] = 148'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 148'h0000000000000000000000000000000000000;
      expv[2] = 148'h0000000000000000000000000000000000000;
      expv[3] = 148'h0000000000000000000000000000000000000;
      expv[4] = 148'h0000000000000000000000000000000000000;
      expv[5] = 148'h0000000000000000000000000000000000000;
      expv[6] = 148'h0000738dfacb94fe920a00000000000000000;
      expv[7] = 148'h0000738dfacb94fe920800000000000000000;
      expv[8] = 148'h0040738dfacb94fe920800000000000000000;
      expv[9] = 148'h0040738dfacb94fe920800000000000000000;
      expv[10] = 148'h0040738dfacb94fe920800000000000000000;
      expv[11] = 148'h0040738dfacb94fe920800000000000000000;
      expv[12] = 148'h0040738dfacb94fe920800000000000000000;
      expv[13] = 148'h0040738dfacb94fe920838a071ef7d1fdf7a7;
      expv[14] = 148'h0040738dfacb94fe920838a071ef7d1fdf7a6;
      expv[15] = 148'h0080738dfacb94fe920838a071ef7d1fdf7a6;
      expv[16] = 148'h0080738dfacb94fe920838a071ef7d1fdf7a6;
      expv[17] = 148'h0080738dfacb94fe920838a071ef7d1fdf7a6;
      expv[18] = 148'h0080738dfacb94fe920838a071ef7d1fdf7a6;
      expv[19] = 148'h0080738dfacb94fe920838a071ef7d1fdf7a6;
      expv[20] = 148'h0080738dfacb94fe920838a071ef7d1fdf7a6;
      expv[21] = 148'h0080738dfacb94fe9208569f924a904a4f3e3;
      expv[22] = 148'h0080738dfacb94fe9208569f924a904a4f3e2;
      expv[23] = 148'h00c0738dfacb94fe9208569f924a904a4f3e2;
      expv[24] = 148'h00c0738dfacb94fe9208569f924a904a4f3e2;
      expv[25] = 148'h00c0738dfacb94fe9208569f924a904a4f3e2;
      expv[26] = 148'h00c0738dfacb94fe9208569f924a904a4f3e2;
      expv[27] = 148'h00c0738dfacb94fe9208569f924a904a4f3e2;
      expv[28] = 148'h00c0738dfacb94fe9208569f924a904a4f3e2;
      expv[29] = 148'h00cf61be5e0d18842f0e569f924a904a4f3e2;
      expv[30] = 148'h00cf61be5e0d18842f0c569f924a904a4f3e2;
      expv[31] = 148'h010f61be5e0d18842f0c569f924a904a4f3e2;
      expv[32] = 148'h010f61be5e0d18842f0c569f924a904a4f3e2;
      expv[33] = 148'h010f61be5e0d18842f0c569f924a904a4f3e2;
      expv[34] = 148'h010f61be5e0d18842f0c569f924a904a4f3e2;
      expv[35] = 148'h010f61be5e0d18842f0c569f924a904a4f3e2;
      expv[36] = 148'h010f61be5e0d18842f0c569f924a904a4f3e2;
      expv[37] = 148'h010f61be5e0d18842f0c569f924a904a4f3e2;
      expv[38] = 148'h010f61be5e0d18842f0c9702d2b3daf1a5689;
      expv[39] = 148'h010f61be5e0d18842f0c9702d2b3daf1a5688;
      expv[40] = 148'h014f61be5e0d18842f0c9702d2b3daf1a5688;
      expv[41] = 148'h014f61be5e0d18842f0c9702d2b3daf1a5688;
      expv[42] = 148'h014f61be5e0d18842f0c9702d2b3daf1a5688;
      expv[43] = 148'h014f61be5e0d18842f0c9702d2b3daf1a5688;
      expv[44] = 148'h01558c7f5c42a428e5669702d2b3daf1a5688;
      expv[45] = 148'h01558c7f5c42a428e5649702d2b3daf1a5688;
      expv[46] = 148'h01958c7f5c42a428e5649702d2b3daf1a5688;
      expv[47] = 148'h01958c7f5c42a428e5649702d2b3daf1a5688;
      expv[48] = 148'h01958c7f5c42a428e5649702d2b3daf1a5688;
      expv[49] = 148'h01958c7f5c42a428e5649702d2b3daf1a5688;
      expv[50] = 148'h019b4cc76f7466d582429702d2b3daf1a5688;
      expv[51] = 148'h019b4cc76f7466d582409702d2b3daf1a5688;
      expv[52] = 148'h01db4cc76f7466d582409702d2b3daf1a5688;
      expv[53] = 148'h01db4cc76f7466d582409702d2b3daf1a5688;
      expv[54] = 148'h0000000000000000000000000000000000000;
      expv[55] = 148'h0000000000000000000000000000000000000;
      expv[56] = 148'h0000000000000000000000000000000000000;
      expv[57] = 148'h0000000000000000000000000000000000000;
      expv[58] = 148'h000137dea3322ff983ca00000000000000000;
      expv[59] = 148'h000137dea3322ff983c800000000000000000;
      expv[60] = 148'h004137dea3322ff983c800000000000000000;
      expv[61] = 148'h004137dea3322ff983c800000000000000000;
      expv[62] = 148'h004137dea3322ff983c800000000000000000;
      expv[63] = 148'h004137dea3322ff983c800000000000000000;
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
