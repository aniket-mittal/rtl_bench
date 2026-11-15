// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06929 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h0ff07dd4294;
    stim[1] = 42'h0c64720e7df;
    stim[2] = 42'h3cf050f3f39;
    stim[3] = 42'h16330d5a33a;
    stim[4] = 42'h0928f4636ff;
    stim[5] = 42'h232cac1b76c;
    stim[6] = 42'h3689eab225b;
    stim[7] = 42'h22aa0f18270;
    stim[8] = 42'h3442c7cdcc3;
    stim[9] = 42'h3917c4478bf;
    stim[10] = 42'h253d0ddb5f7;
    stim[11] = 42'h162b1403116;
    stim[12] = 42'h2379ad5121a;
    stim[13] = 42'h26669eb6b20;
    stim[14] = 42'h26f6b92a5c0;
    stim[15] = 42'h19b4c878d68;
    stim[16] = 42'h3c043477126;
    stim[17] = 42'h0bea45907d5;
    stim[18] = 42'h2dbc4a6e4f6;
    stim[19] = 42'h0b4e43d53e0;
    stim[20] = 42'h34e4982243e;
    stim[21] = 42'h323880e4dca;
    stim[22] = 42'h2d97cd59bcc;
    stim[23] = 42'h055b9b7477a;
    stim[24] = 42'h0743d45781a;
    stim[25] = 42'h360e1ddac2b;
    stim[26] = 42'h1b0dd256a95;
    stim[27] = 42'h3f7bc675827;
    stim[28] = 42'h376aa2abf43;
    stim[29] = 42'h0456de9dfea;
    stim[30] = 42'h2ad3efef23c;
    stim[31] = 42'h210598ab6d9;
    stim[32] = 42'h15e4a729f01;
    stim[33] = 42'h00539d1f260;
    stim[34] = 42'h016529d0862;
    stim[35] = 42'h35d7ffbd376;
    stim[36] = 42'h0c260904ab4;
    stim[37] = 42'h0abae9929c7;
    stim[38] = 42'h39c76a3c723;
    stim[39] = 42'h3ac550070c6;
    stim[40] = 42'h021dc47dd16;
    stim[41] = 42'h0f08fa74e6f;
    stim[42] = 42'h2364e88b0e2;
    stim[43] = 42'h3ec4c22efb5;
    stim[44] = 42'h1760e1ba2f6;
    stim[45] = 42'h1f6d8901a59;
    stim[46] = 42'h032ff2b078c;
    stim[47] = 42'h0ace46688b5;
    stim[48] = 42'h06356a35346;
    stim[49] = 42'h0451780dc52;
    stim[50] = 42'h234e877f284;
    stim[51] = 42'h3decea47f19;
    stim[52] = 42'h26624a8319f;
    stim[53] = 42'h09194a1df83;
    stim[54] = 42'h353fcd1dacd;
    stim[55] = 42'h24ac09ccce5;
    stim[56] = 42'h28da321fd24;
    stim[57] = 42'h1cccc83ac65;
    stim[58] = 42'h3ed61669d5e;
    stim[59] = 42'h02590b1e5e8;
    stim[60] = 42'h06633869508;
    stim[61] = 42'h24a135f945e;
    stim[62] = 42'h22248d8fdc5;
    stim[63] = 42'h10b95013660;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxx000;
      expv[3] = 51'h6782879f9c080;
      expv[4] = 51'h6782879f9c000;
      expv[5] = 51'h4947a31b7e080;
      expv[6] = 51'h4947a31b7e000;
      expv[7] = 51'h4947a31b7e000;
      expv[8] = 51'h155078c138010;
      expv[9] = 51'h155078c138000;
      expv[10] = 51'h48be223c5e000;
      expv[11] = 51'h48be223c5e000;
      expv[12] = 51'h48be223c5e000;
      expv[13] = 51'h48be223c5e000;
      expv[14] = 51'h48be223c5e000;
      expv[15] = 51'h48be223c5e000;
      expv[16] = 51'h48be223c5e000;
      expv[17] = 51'h48be223c5e000;
      expv[18] = 51'h5f522c83ea000;
      expv[19] = 51'h5f522c83ea000;
      expv[20] = 51'h5a721ea9f1000;
      expv[21] = 51'h5a721ea9f0000;
      expv[22] = 51'h11c40726e4010;
      expv[23] = 51'h11c40726e4000;
      expv[24] = 51'h11c40726e4000;
      expv[25] = 51'h3a1ea2bc0c004;
      expv[26] = 51'h3a1ea2bc0c000;
      expv[27] = 51'h3a1ea2bc0c000;
      expv[28] = 51'h3a1ea2bc0c000;
      expv[29] = 51'h3b55155fa0040;
      expv[30] = 51'h3b55155fa0000;
      expv[31] = 51'h3b55155fa0000;
      expv[32] = 51'h3b55155fa0000;
      expv[33] = 51'h3b55155fa0000;
      expv[34] = 51'h3b55155fa0000;
      expv[35] = 51'h3b55155fa0000;
      expv[36] = 51'h2ebffde9ba040;
      expv[37] = 51'h2ebffde9ba000;
      expv[38] = 51'h2ebffde9ba000;
      expv[39] = 51'h4e3b51e390080;
      expv[40] = 51'h4e3b51e390000;
      expv[41] = 51'h4e3b51e390000;
      expv[42] = 51'h4e3b51e390000;
      expv[43] = 51'h4e3b51e390000;
      expv[44] = 51'h4e3b51e390000;
      expv[45] = 51'h4e3b51e390000;
      expv[46] = 51'h7b6c480d2c020;
      expv[47] = 51'h7b6c480d2c000;
      expv[48] = 51'h7b6c480d2c000;
      expv[49] = 51'h7b6c480d2c000;
      expv[50] = 51'h228bc06e28002;
      expv[51] = 51'h228bc06e28000;
      expv[52] = 51'h228bc06e28000;
      expv[53] = 51'h228bc06e28000;
      expv[54] = 51'h48ca50efc1000;
      expv[55] = 51'h48ca50efc0000;
      expv[56] = 51'h48ca50efc0000;
      expv[57] = 51'h48ca50efc0000;
      expv[58] = 51'h48ca50efc0000;
      expv[59] = 51'h48ca50efc0000;
      expv[60] = 51'h12c858f2f4000;
      expv[61] = 51'h12c858f2f4000;
      expv[62] = 51'h12c858f2f4000;
      expv[63] = 51'h11246c7ee2000;
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
