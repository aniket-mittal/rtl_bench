// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 77;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00958 dut (
    .clk(clk),
    .stall(in_vec[76:76]),
    .flush(in_vec[75:75]),
    .MemData_Mem(in_vec[74:43]),
    .Rd_write_byte_en_Mem(in_vec[42:39]),
    .WBData_Mem(in_vec[38:7]),
    .MemRead_Mem(in_vec[6:6]),
    .RegWrite_Mem(in_vec[5:5]),
    .Rd_Mem(in_vec[4:0]),
    .MemData_Wr(out_vec[74:43]),
    .Rd_write_byte_en_Wr(out_vec[42:39]),
    .WBData_Wr(out_vec[38:7]),
    .MemRead_Wr(out_vec[6:6]),
    .RegWrite_Wr(out_vec[5:5]),
    .Rd_Wr(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 77'h095a3f78e863fdd65586;
    stim[1] = 77'h19e227bbd32992a43630;
    stim[2] = 77'h01a4542b126a3f62ddf8;
    stim[3] = 77'h1e52a8256c4e7586f599;
    stim[4] = 77'h147b5ced45c01324a8f7;
    stim[5] = 77'h0b1eedfa81c6a9ab1ab0;
    stim[6] = 77'h15a5db249e346030fbc9;
    stim[7] = 77'h1b0e3303c37e27a8ba54;
    stim[8] = 77'h18935cd0eb961b128c57;
    stim[9] = 77'h198a3f03c789689476b6;
    stim[10] = 77'h15a0a6dd26e4ac224737;
    stim[11] = 77'h1703a043b7dc4f0e0f60;
    stim[12] = 77'h059e149a2daddd4741b6;
    stim[13] = 77'h06ba539f87a17373886e;
    stim[14] = 77'h178d152178f99e3b71a8;
    stim[15] = 77'h053f76851441abd83130;
    stim[16] = 77'h02ef5d7d4c642f47268a;
    stim[17] = 77'h054fa87a33b39298b002;
    stim[18] = 77'h18c7e0fb7644be526bb8;
    stim[19] = 77'h048c719ae6036bec8029;
    stim[20] = 77'h1466d6d5b06439775217;
    stim[21] = 77'h0acb3cdd0df11f4c9651;
    stim[22] = 77'h0d9a916e22fac0ecec39;
    stim[23] = 77'h028ef7019ae403e5f80a;
    stim[24] = 77'h1c44994f38f65bbceb71;
    stim[25] = 77'h1addaecc5a8dcf49dcae;
    stim[26] = 77'h029f349843d4a1cb450d;
    stim[27] = 77'h1b95ea49af7390a59181;
    stim[28] = 77'h171e074c7a6782df07df;
    stim[29] = 77'h044e0aa944cf1450c0ab;
    stim[30] = 77'h0829a5d1daa8566c9c78;
    stim[31] = 77'h1443df4e8aa7cd2dcc6d;
    stim[32] = 77'h0c51f38051c81065cdb4;
    stim[33] = 77'h0d6816a5952fe5ab03de;
    stim[34] = 77'h1cbdececc68bbd52e96c;
    stim[35] = 77'h03d2fe410c14575358dd;
    stim[36] = 77'h06cf3e0948a4f309f8b1;
    stim[37] = 77'h0801fe702229a9ec0fb2;
    stim[38] = 77'h19fcd02fb96385414f99;
    stim[39] = 77'h0a7d092382f48ee3a329;
    stim[40] = 77'h039ed9b4509d51ecde50;
    stim[41] = 77'h19f297461aab23d399c5;
    stim[42] = 77'h0dff64c9db5016df5317;
    stim[43] = 77'h033f9262450f7f343195;
    stim[44] = 77'h14fe155bc17a6bac6d4b;
    stim[45] = 77'h0a56fe9d096c846b7bb9;
    stim[46] = 77'h0738b2cf3fa668a9faca;
    stim[47] = 77'h14ec020cef4fb84496af;
    stim[48] = 77'h173c95eed7a8fd48e8ef;
    stim[49] = 77'h1d5768ff044471a85311;
    stim[50] = 77'h0b061c5233945e3ea4e4;
    stim[51] = 77'h1beaf030c953b4a2d629;
    stim[52] = 77'h0c6290b1d3b28e31beac;
    stim[53] = 77'h146965ba12ec21782f01;
    stim[54] = 77'h082d11114b413d09db83;
    stim[55] = 77'h0a8b1042eed923c7103e;
    stim[56] = 77'h14a0cc17913ccb6a4773;
    stim[57] = 77'h119707ab597172222208;
    stim[58] = 77'h0f0cb7e7a19fbf9f5ce6;
    stim[59] = 77'h061123a42ec5768c32bd;
    stim[60] = 77'h00cfd72e9e554e947b7a;
    stim[61] = 77'h1f751673f4b0e57decee;
    stim[62] = 77'h028eb1821e2451e491bf;
    stim[63] = 77'h07cc04f112ab8b470e77;
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
      expv[0] = 75'h0000000000000000000;
      expv[1] = 75'h0000000000000000000;
      expv[2] = 75'h0000000000000000000;
      expv[3] = 75'h1a4542b126a3f62ddf8;
      expv[4] = 75'h0000000000000000000;
      expv[5] = 75'h0000000000000000000;
      expv[6] = 75'h0000000000000000000;
      expv[7] = 75'h0000000000000000000;
      expv[8] = 75'h0000000000000000000;
      expv[9] = 75'h0000000000000000000;
      expv[10] = 75'h0000000000000000000;
      expv[11] = 75'h0000000000000000000;
      expv[12] = 75'h0000000000000000000;
      expv[13] = 75'h59e149a2daddd4741b6;
      expv[14] = 75'h6ba539f87a17373886e;
      expv[15] = 75'h6ba539f87a17373886e;
      expv[16] = 75'h53f76851441abd83130;
      expv[17] = 75'h2ef5d7d4c642f47268a;
      expv[18] = 75'h54fa87a33b39298b002;
      expv[19] = 75'h0000000000000000000;
      expv[20] = 75'h48c719ae6036bec8029;
      expv[21] = 75'h48c719ae6036bec8029;
      expv[22] = 75'h0000000000000000000;
      expv[23] = 75'h0000000000000000000;
      expv[24] = 75'h28ef7019ae403e5f80a;
      expv[25] = 75'h0000000000000000000;
      expv[26] = 75'h0000000000000000000;
      expv[27] = 75'h29f349843d4a1cb450d;
      expv[28] = 75'h0000000000000000000;
      expv[29] = 75'h0000000000000000000;
      expv[30] = 75'h44e0aa944cf1450c0ab;
      expv[31] = 75'h0000000000000000000;
      expv[32] = 75'h0000000000000000000;
      expv[33] = 75'h0000000000000000000;
      expv[34] = 75'h0000000000000000000;
      expv[35] = 75'h0000000000000000000;
      expv[36] = 75'h3d2fe410c14575358dd;
      expv[37] = 75'h6cf3e0948a4f309f8b1;
      expv[38] = 75'h0000000000000000000;
      expv[39] = 75'h0000000000000000000;
      expv[40] = 75'h0000000000000000000;
      expv[41] = 75'h39ed9b4509d51ecde50;
      expv[42] = 75'h0000000000000000000;
      expv[43] = 75'h0000000000000000000;
      expv[44] = 75'h33f9262450f7f343195;
      expv[45] = 75'h33f9262450f7f343195;
      expv[46] = 75'h0000000000000000000;
      expv[47] = 75'h738b2cf3fa668a9faca;
      expv[48] = 75'h738b2cf3fa668a9faca;
      expv[49] = 75'h738b2cf3fa668a9faca;
      expv[50] = 75'h0000000000000000000;
      expv[51] = 75'h0000000000000000000;
      expv[52] = 75'h0000000000000000000;
      expv[53] = 75'h0000000000000000000;
      expv[54] = 75'h0000000000000000000;
      expv[55] = 75'h0000000000000000000;
      expv[56] = 75'h0000000000000000000;
      expv[57] = 75'h0000000000000000000;
      expv[58] = 75'h0000000000000000000;
      expv[59] = 75'h0000000000000000000;
      expv[60] = 75'h61123a42ec5768c32bd;
      expv[61] = 75'h0cfd72e9e554e947b7a;
      expv[62] = 75'h0000000000000000000;
      expv[63] = 75'h28eb1821e2451e491bf;
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
