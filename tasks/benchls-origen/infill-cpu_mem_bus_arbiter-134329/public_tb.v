// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 116;
  localparam OW = 139;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134329 dut (
    .clk(clk),
    .reset_n(in_vec[115:115]),
    .d_readdata(in_vec[114:83]),
    .d_waitrequest(in_vec[82:82]),
    .i_readdata(in_vec[81:50]),
    .i_waitrequest(in_vec[49:49]),
    .irq(in_vec[48:48]),
    .debug_mem_slave_address(in_vec[47:39]),
    .debug_mem_slave_byteenable(in_vec[38:35]),
    .debug_mem_slave_debugaccess(in_vec[34:34]),
    .debug_mem_slave_read(in_vec[33:33]),
    .debug_mem_slave_write(in_vec[32:32]),
    .debug_mem_slave_writedata(in_vec[31:0]),
    .d_address(out_vec[138:107]),
    .d_byteenable(out_vec[106:103]),
    .d_read(out_vec[102:102]),
    .d_write(out_vec[101:101]),
    .d_writedata(out_vec[100:69]),
    .debug_mem_slave_readdata(out_vec[68:37]),
    .debug_mem_slave_waitrequest(out_vec[36:36]),
    .i_address(out_vec[35:4]),
    .i_read(out_vec[3:3]),
    .debug_mem_slave_debugaccess_to_roms(out_vec[2:2]),
    .debug_reset_request(out_vec[1:1]),
    .dummy_ci_port(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 116'h40f19eafdf4135deea974fbdfcb24;
    stim[1] = 116'h671375db9862aadbc576a784ee85f;
    stim[2] = 116'hd73eab4da808dfe597b1330cb1001;
    stim[3] = 116'he9fef5b52c761d822d8f5c550ed01;
    stim[4] = 116'he9eb0164552d529ce7973bab51741;
    stim[5] = 116'hf266512ea60e8b4135f6e284dc16e;
    stim[6] = 116'hda9f55bd0657cfa502a41df661f36;
    stim[7] = 116'haecd05a532924d886241a14f8eba9;
    stim[8] = 116'ha069e4079f7da8df1f1096f764786;
    stim[9] = 116'hc7036d844f34f94418393494b3eb5;
    stim[10] = 116'h9a82fbee77cfb3cc5ed97715d59c2;
    stim[11] = 116'hc49bb92acb15f65752ddadfbe67b2;
    stim[12] = 116'hd1ed2002711150d408191d13062f7;
    stim[13] = 116'hef1c3c111746a3a0e85d40266422a;
    stim[14] = 116'haeefd42377c4b46c1e99455e988e2;
    stim[15] = 116'hd7e8b74a898b7514789a04310a90e;
    stim[16] = 116'hefd372731a3676add95539b5c00ce;
    stim[17] = 116'had5ea45806fa171cf9f2ca184737f;
    stim[18] = 116'haac01b0c6207a5f48e662c7449427;
    stim[19] = 116'hb83d393c8ea6b2f90c10c46d92104;
    stim[20] = 116'hb7a35b30b620115e0910e3b0474f2;
    stim[21] = 116'hf816a24d64df3076f38c79399630e;
    stim[22] = 116'h95c472d1c628bd6ae16b8a0b26c41;
    stim[23] = 116'he7fcc0a2929e61c2f476cf4f63ef7;
    stim[24] = 116'hf4c012cd4a50d9a5a2faaf5acb291;
    stim[25] = 116'h9b59b0e56dff032d97480ae776f74;
    stim[26] = 116'h96dabf11691ba7fe0b8a8f1092083;
    stim[27] = 116'h9ac59a449ece19a75f32c7529a5bc;
    stim[28] = 116'hd76eb1e1d88c4398c5f3ddb00674a;
    stim[29] = 116'hb5c2644b578baec22be8026c44ba0;
    stim[30] = 116'hd69ef02f57eab0d6410a92f455a3f;
    stim[31] = 116'hf4e17c7e8d3fb9b6c81955f817dc6;
    stim[32] = 116'hf641aacd451ddaf0e9e294d7de31d;
    stim[33] = 116'haa2e71e21d18a7d21be5da4db7daa;
    stim[34] = 116'h899142d7f7783e00c8356b451a127;
    stim[35] = 116'h0e3fd99ee1f77ec610c37d74f2a12;
    stim[36] = 116'h9d3c3b681c4e81cdf979bb5fd2016;
    stim[37] = 116'hcc2bec8f6bb57bdfef96094ba8856;
    stim[38] = 116'hcf30e385a3d5f1e177143799c6890;
    stim[39] = 116'hab544e79558e6e98dec3865da7782;
    stim[40] = 116'hcbb2b01b758192b890bd0a0269eeb;
    stim[41] = 116'h96c15e174b94e0b3c0442554baa5a;
    stim[42] = 116'hc6c669d38de4b252ad57c1cde60a9;
    stim[43] = 116'hc0ac6ed730e5b4da436d20dac5631;
    stim[44] = 116'h9587bd8ffd553e489707a85adff3f;
    stim[45] = 116'hc5d4c86bad1b03602804a95b3eef8;
    stim[46] = 116'h84a07c231f3eacc5ee2939625d775;
    stim[47] = 116'haf24abae19901dfbc38ab938ab3bc;
    stim[48] = 116'he629188e2aa054b461ba1902c3fa1;
    stim[49] = 116'h8298439cff80d2109056bedce0ba4;
    stim[50] = 116'he7ea12719dc67ad73078f45e6134a;
    stim[51] = 116'h86bf8630c5218d672121f5dfda356;
    stim[52] = 116'hbf2a5b298c4c55bab5ba25932be4c;
    stim[53] = 116'h9d5401a242bd3eced8ea5c207414f;
    stim[54] = 116'h5c4d4ce5ba0ce7a6de04693843550;
    stim[55] = 116'hc547e663cc85d506ef55f7bacb4ec;
    stim[56] = 116'hd54bc64e0eb7c92c94682cbc3e846;
    stim[57] = 116'hc4ba8423a7ab576c57b7f861f4bda;
    stim[58] = 116'hc210e9aed474ff6397a214ed7e739;
    stim[59] = 116'hb0a26682fd17a4851fef1028a2ee2;
    stim[60] = 116'hc1121fff87dd84fea8c71f21333da;
    stim[61] = 116'hca968733b6d2d6fa503f5f4835d2a;
    stim[62] = 116'had8bcc6543575e903fe83e06a2d33;
    stim[63] = 116'he116fb9550fbf696de888fd6912ee;
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
      expv[0] = 139'h00000000000000000000000000000000000;
      expv[1] = 139'h00000000000000000000000000000000000;
      expv[2] = 139'h00000000000000000000000000000000000;
      expv[3] = 139'h00000000000000000000000001000000000;
      expv[4] = 139'h000000d8f38aa1da0200000000000000004;
      expv[5] = 139'h000000d8f38aa1da0200000001000000004;
      expv[6] = 139'h000000d8f38aa1da0200000000000000004;
      expv[7] = 139'h000000d8f38aa1da0200000001000000004;
      expv[8] = 139'h000000d8f38aa1da0200000000000000004;
      expv[9] = 139'h000000d8f38aa1da0200000001000000004;
      expv[10] = 139'h000000d8f38aa1da0200000000000000004;
      expv[11] = 139'h000000d8f38aa1da0200000001000000004;
      expv[12] = 139'h000000d8f38aa1da0200000000000000004;
      expv[13] = 139'h000000d8f38aa1da0200000001000000004;
      expv[14] = 139'h000000d8f38aa1da0200000000000000004;
      expv[15] = 139'h000000d8f38aa1da0200000000000000004;
      expv[16] = 139'h000000d8f18aa1da0200000000000000004;
      expv[17] = 139'h000000d8f18aa1da0200000001000000004;
      expv[18] = 139'h000000d8f18aa1da0200000000000000004;
      expv[19] = 139'h000000d8f18aa1da0200000001000000004;
      expv[20] = 139'h000000d8f18aa1da0200000000000000004;
      expv[21] = 139'h000000d8f18aa1da0200000001000000004;
      expv[22] = 139'h000000d8f18aa1da0200000000000000004;
      expv[23] = 139'h000000d8f18aa1da0200000000000000004;
      expv[24] = 139'h000000d8f18aa1da0200000000000000004;
      expv[25] = 139'h000000d8f18aa1da0200000001000000004;
      expv[26] = 139'h000000d8f18aa1da0200000000000000004;
      expv[27] = 139'h000000d8f18aa1da0200000000000000004;
      expv[28] = 139'h000000d8f18aa1da0200000000000000004;
      expv[29] = 139'h000000d8f18aa1da0200000001000000004;
      expv[30] = 139'h000000d8f18aa1da0200000000000000004;
      expv[31] = 139'h000000d8f18aa1da0200000001000000004;
      expv[32] = 139'h0000008192bf02fb8c00000000000000004;
      expv[33] = 139'h0000008192bf02fb8c00000001000000004;
      expv[34] = 139'h000000be5b49b6fb5400000000000000004;
      expv[35] = 139'h00000000000000000000000000000000000;
      expv[36] = 139'h00000000000000000000000000000000000;
      expv[37] = 139'h00000000000000000000000001000000000;
      expv[38] = 139'h00000000000000000000000000000000000;
      expv[39] = 139'h00000000000000000000000001000000000;
      expv[40] = 139'h00000000000000000000000000000000000;
      expv[41] = 139'h00000000000000000000000000000000000;
      expv[42] = 139'h00000000000000000000000001000000000;
      expv[43] = 139'h00000000000000000000000000000000004;
      expv[44] = 139'h00000000000000000000000001000000004;
      expv[45] = 139'h00000000000000000000000000000000004;
      expv[46] = 139'h00000000000000000000000001000000004;
      expv[47] = 139'h00000000000000000000000000000000004;
      expv[48] = 139'h00000000000000000000000001000000004;
      expv[49] = 139'h0000001ba320587f4200000000000000004;
      expv[50] = 139'h0000001ba320587f4200000001000000004;
      expv[51] = 139'h0000001ba320587f4200000000000000004;
      expv[52] = 139'h0000001ba320587f4200000001000000004;
      expv[53] = 139'h0000001ba320587f4200000000000000004;
      expv[54] = 139'h00000000000000000000000000000000000;
      expv[55] = 139'h00000000000000000000000000000000000;
      expv[56] = 139'h00000000000000000000000001000000000;
      expv[57] = 139'h00000000000000000000000000000000000;
      expv[58] = 139'h00000000000000000000000001000000000;
      expv[59] = 139'h0000007a229dafce7200000000000000000;
      expv[60] = 139'h0000007a229dafce7200000001000000000;
      expv[61] = 139'h0000008c73e42667b400000000000000000;
      expv[62] = 139'h0000008c73e42667b400000001000000000;
      expv[63] = 139'h0000008c73e42667b400000000000000000;
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
