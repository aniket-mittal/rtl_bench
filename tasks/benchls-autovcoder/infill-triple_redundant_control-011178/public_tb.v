// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011178 dut (
    .clk_sys(clk),
    .rst_n(in_vec[17:17]),
    .change(in_vec[16:16]),
    .pluse_start1(in_vec[15:15]),
    .pluse_start2(in_vec[14:14]),
    .off_test1(in_vec[13:13]),
    .off_test2(in_vec[12:12]),
    .dump_start1(in_vec[11:11]),
    .dump_start2(in_vec[10:10]),
    .phase_ctr1(in_vec[9:9]),
    .phase_ctr2(in_vec[8:8]),
    .reset_out1(in_vec[7:7]),
    .reset_out2(in_vec[6:6]),
    .dumpoff_ctr1(in_vec[5:5]),
    .dumpoff_ctr2(in_vec[4:4]),
    .tetw_pluse1(in_vec[3:3]),
    .tetw_pluse2(in_vec[2:2]),
    .turn_delay1(in_vec[1:1]),
    .turn_delay2(in_vec[0:0]),
    .pluse_start(out_vec[7:7]),
    .off_test(out_vec[6:6]),
    .dump_start(out_vec[5:5]),
    .phase_ctr(out_vec[4:4]),
    .reset_out(out_vec[3:3]),
    .dumpoff_ctr(out_vec[2:2]),
    .tetw_pluse(out_vec[1:1]),
    .turn_delay(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h12881;
    stim[1] = 18'h0f4fc;
    stim[2] = 18'h29289;
    stim[3] = 18'h39919;
    stim[4] = 18'h2ea91;
    stim[5] = 18'h25de4;
    stim[6] = 18'h2b5dc;
    stim[7] = 18'h3647d;
    stim[8] = 18'h237c2;
    stim[9] = 18'h2b4c6;
    stim[10] = 18'h350ec;
    stim[11] = 18'h30a96;
    stim[12] = 18'h10b31;
    stim[13] = 18'h0bc75;
    stim[14] = 18'h2c452;
    stim[15] = 18'h2835c;
    stim[16] = 18'h32596;
    stim[17] = 18'h24f08;
    stim[18] = 18'h3783e;
    stim[19] = 18'h39552;
    stim[20] = 18'h3fa8d;
    stim[21] = 18'h2e2ad;
    stim[22] = 18'h22fb8;
    stim[23] = 18'h2097d;
    stim[24] = 18'h22f9a;
    stim[25] = 18'h299cb;
    stim[26] = 18'h3b5fc;
    stim[27] = 18'h3e272;
    stim[28] = 18'h367e0;
    stim[29] = 18'h251af;
    stim[30] = 18'h3d3f5;
    stim[31] = 18'h27a7d;
    stim[32] = 18'h20f76;
    stim[33] = 18'h2c142;
    stim[34] = 18'h311d5;
    stim[35] = 18'h25bce;
    stim[36] = 18'h2c38e;
    stim[37] = 18'h2b73e;
    stim[38] = 18'h38736;
    stim[39] = 18'h2e386;
    stim[40] = 18'h3fb98;
    stim[41] = 18'h2244c;
    stim[42] = 18'h35edb;
    stim[43] = 18'h147fb;
    stim[44] = 18'h23c10;
    stim[45] = 18'h3fbd4;
    stim[46] = 18'h3fe7c;
    stim[47] = 18'h3d237;
    stim[48] = 18'h3e7ef;
    stim[49] = 18'h342d7;
    stim[50] = 18'h30956;
    stim[51] = 18'h2c1c9;
    stim[52] = 18'h2987b;
    stim[53] = 18'h207a1;
    stim[54] = 18'h2000a;
    stim[55] = 18'h2a368;
    stim[56] = 18'h23081;
    stim[57] = 18'h38be7;
    stim[58] = 18'h20c04;
    stim[59] = 18'h3c3c0;
    stim[60] = 18'h20569;
    stim[61] = 18'h24220;
    stim[62] = 18'h267f6;
    stim[63] = 18'h3fa6c;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h0x;
      expv[2] = 8'h0x;
      expv[3] = 8'h41;
      expv[4] = 8'ha2;
      expv[5] = 8'h85;
      expv[6] = 8'hfa;
      expv[7] = 8'h7e;
      expv[8] = 8'h46;
      expv[9] = 8'h78;
      expv[10] = 8'h6a;
      expv[11] = 8'h0e;
      expv[12] = 8'h39;
      expv[13] = 8'h01;
      expv[14] = 8'h01;
      expv[15] = 8'hac;
      expv[16] = 8'h1e;
      expv[17] = 8'h49;
      expv[18] = 8'hb0;
      expv[19] = 8'h67;
      expv[20] = 8'h81;
      expv[21] = 8'hfa;
      expv[22] = 8'h83;
      expv[23] = 8'h34;
      expv[24] = 8'h1f;
      expv[25] = 8'h34;
      expv[26] = 8'h59;
      expv[27] = 8'hce;
      expv[28] = 8'hd5;
      expv[29] = 8'h5c;
      expv[30] = 8'hd3;
      expv[31] = 8'h9c;
      expv[32] = 8'hcf;
      expv[33] = 8'h3e;
      expv[34] = 8'h98;
      expv[35] = 8'h08;
      expv[36] = 8'hda;
      expv[37] = 8'h92;
      expv[38] = 8'h76;
      expv[39] = 8'h95;
      expv[40] = 8'h92;
      expv[41] = 8'hfa;
      expv[42] = 8'h2a;
      expv[43] = 8'h3b;
      expv[44] = 8'h01;
      expv[45] = 8'h64;
      expv[46] = 8'hf8;
      expv[47] = 8'hf6;
      expv[48] = 8'h95;
      expv[49] = 8'hdf;
      expv[50] = 8'h19;
      expv[51] = 8'h21;
      expv[52] = 8'h99;
      expv[53] = 8'h4d;
      expv[54] = 8'h31;
      expv[55] = 8'h00;
      expv[56] = 8'h18;
      expv[57] = 8'h41;
      expv[58] = 8'hbd;
      expv[59] = 8'h22;
      expv[60] = 8'h98;
      expv[61] = 8'h39;
      expv[62] = 8'h80;
      expv[63] = 8'hbe;
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
