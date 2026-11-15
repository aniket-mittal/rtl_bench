// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063096 dut (
    .i_clk(clk),
    .i_reset(in_vec[106:106]),
    .i_wb_cyc(in_vec[105:105]),
    .i_wb_stb(in_vec[104:104]),
    .i_wb_we(in_vec[103:103]),
    .i_wb_addr(in_vec[102:71]),
    .i_wb_data(in_vec[70:39]),
    .i_wb_sel(in_vec[38:35]),
    .i_wb_ack(in_vec[34:34]),
    .i_wb_stall(in_vec[33:33]),
    .i_wb_idata(in_vec[32:1]),
    .i_wb_err(in_vec[0:0]),
    .f_nreqs(out_vec[11:8]),
    .f_nacks(out_vec[7:4]),
    .f_outstanding(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h4f46dff29cfa492d95f35f0a1a0;
    stim[1] = 107'h472e2f40eb2272ddbb0307eb3b2;
    stim[2] = 107'h1c8f580193b69aed23583ec5c24;
    stim[3] = 107'h15c95ed034661174376c6e8025c;
    stim[4] = 107'h0826f6d59278850afb7ba9d31bf;
    stim[5] = 107'h161d30373f838dc4477e2690781;
    stim[6] = 107'h2cbd237104f75cb08283bd703be;
    stim[7] = 107'h1cc6c451a02e3a5fbbfe27a1d9f;
    stim[8] = 107'h3dcb24e945d6783a79103ccec1a;
    stim[9] = 107'h0e8c8454cbbe9b0b7ed288cc1e4;
    stim[10] = 107'h2381827f4a2cc1da1a898166af0;
    stim[11] = 107'h36c19f758757b88f0598a708cc0;
    stim[12] = 107'h11626feceaafef4599c094c5331;
    stim[13] = 107'h2943822070d2970600faa1a81f2;
    stim[14] = 107'h199b668921e499d155e9a837519;
    stim[15] = 107'h2aca044abea85da9c5890e8ed99;
    stim[16] = 107'h1f506ed8cbec3c3539a4bae6df6;
    stim[17] = 107'h03be2d925678dc3abaa48d05ea3;
    stim[18] = 107'h1061a4caf05a5bd82eb12766b67;
    stim[19] = 107'h31b5e2baccf928123fb70dfa1b1;
    stim[20] = 107'h0c7b69f031ddbc30239cdcb783f;
    stim[21] = 107'h2df27ba2c1f057ed7814d7c5703;
    stim[22] = 107'h066d5d05d3cf95b7ddd77759f62;
    stim[23] = 107'h205b8698c37b1772ad20ecc2406;
    stim[24] = 107'h34894b53cca8096609ed78f337b;
    stim[25] = 107'h15e5d48e59d9a63e87482ad1e52;
    stim[26] = 107'h15c14966df687bf995031d7fecd;
    stim[27] = 107'h6b38b6171262bc56b7c900b893e;
    stim[28] = 107'h3f7cf940a329bbe671b72c11602;
    stim[29] = 107'h313c120c9f9b9b792daa04dc60e;
    stim[30] = 107'h23b741c66a5e8c54e3f9dd27d88;
    stim[31] = 107'h042d03295ca19a7722c8865b616;
    stim[32] = 107'h1e32b71415b9fa870f77a99f710;
    stim[33] = 107'h12c1cacc976200d05649967bdc7;
    stim[34] = 107'h07033423b044c58d985beaea9f3;
    stim[35] = 107'h43415c8df60226bb00583b9fb4a;
    stim[36] = 107'h65db6736a0cbe8d2bc90832999c;
    stim[37] = 107'h34af1bbb9a9c578d38023f8a1df;
    stim[38] = 107'h21bb612bc6e81744f93e582def4;
    stim[39] = 107'h05b8a1b81c6ad7cb0a7aeb2821a;
    stim[40] = 107'h1a6ccac26cf95876fe18fd0bac6;
    stim[41] = 107'h09bc52657e6307d964c2101e7dc;
    stim[42] = 107'h04499f14389e92a06ad705c484e;
    stim[43] = 107'h3c7c5918a49fe9c0b36c3f6d39b;
    stim[44] = 107'h2f0a2be4439487374ebccda1db9;
    stim[45] = 107'h3627a65cee97e345003a962fcec;
    stim[46] = 107'h1f998b41a556c6411d741c0242c;
    stim[47] = 107'h3c359b1f6196aea5b0ca10fdb88;
    stim[48] = 107'h2f9342875297d5157328d3450ba;
    stim[49] = 107'h009d1c26a7319e0f857b7bd390a;
    stim[50] = 107'h17219e62c4cf5f68b028c362cdc;
    stim[51] = 107'h2d4f68a88113666c2815784c387;
    stim[52] = 107'h148f987341a56dda3cc245fa0ad;
    stim[53] = 107'h0958b588172ed4f423d82acf24a;
    stim[54] = 107'h2a39743fdf01dd5a552b14e832d;
    stim[55] = 107'h0023e5182e91d827d68b3173a0b;
    stim[56] = 107'h1d4a3494cb2b00649012dffdedc;
    stim[57] = 107'h2739780af5beac9ddedd124a12f;
    stim[58] = 107'h2d6fba08fd34c63febadca15c96;
    stim[59] = 107'h3b9de32387a2e1f43e8461abd22;
    stim[60] = 107'h24613ebc54951cad9055b96feea;
    stim[61] = 107'h27a66eba3ea99a3d574a590e7c4;
    stim[62] = 107'h01c111759f41d6af1703ebe3378;
    stim[63] = 107'h0a775ee287336ba26133f95a58d;
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
      expv[0] = 12'h000;
      expv[1] = 12'h000;
      expv[2] = 12'h000;
      expv[3] = 12'h000;
      expv[4] = 12'h000;
      expv[5] = 12'h000;
      expv[6] = 12'h000;
      expv[7] = 12'h000;
      expv[8] = 12'h000;
      expv[9] = 12'h100;
      expv[10] = 12'h000;
      expv[11] = 12'h000;
      expv[12] = 12'h100;
      expv[13] = 12'h000;
      expv[14] = 12'h010;
      expv[15] = 12'h000;
      expv[16] = 12'h010;
      expv[17] = 12'h000;
      expv[18] = 12'h000;
      expv[19] = 12'h000;
      expv[20] = 12'h010;
      expv[21] = 12'h000;
      expv[22] = 12'h010;
      expv[23] = 12'h000;
      expv[24] = 12'h000;
      expv[25] = 12'h010;
      expv[26] = 12'h000;
      expv[27] = 12'h000;
      expv[28] = 12'h000;
      expv[29] = 12'h000;
      expv[30] = 12'h000;
      expv[31] = 12'h010;
      expv[32] = 12'h000;
      expv[33] = 12'h000;
      expv[34] = 12'h000;
      expv[35] = 12'h000;
      expv[36] = 12'h000;
      expv[37] = 12'h000;
      expv[38] = 12'h110;
      expv[39] = 12'h110;
      expv[40] = 12'h000;
      expv[41] = 12'h000;
      expv[42] = 12'h000;
      expv[43] = 12'h000;
      expv[44] = 12'h01f;
      expv[45] = 12'h02e;
      expv[46] = 12'h020;
      expv[47] = 12'h000;
      expv[48] = 12'h110;
      expv[49] = 12'h110;
      expv[50] = 12'h000;
      expv[51] = 12'h000;
      expv[52] = 12'h010;
      expv[53] = 12'h000;
      expv[54] = 12'h000;
      expv[55] = 12'h010;
      expv[56] = 12'h000;
      expv[57] = 12'h000;
      expv[58] = 12'h01f;
      expv[59] = 12'h01f;
      expv[60] = 12'h110;
      expv[61] = 12'h12f;
      expv[62] = 12'h130;
      expv[63] = 12'h000;
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
