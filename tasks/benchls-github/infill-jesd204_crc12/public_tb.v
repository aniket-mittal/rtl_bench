// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  jesd204_crc12 dut (
    .clk(clk),
    .reset(in_vec[65:65]),
    .init(in_vec[64:64]),
    .data_in(in_vec[63:0]),
    .crc12(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h332ed489d6344812c;
    stim[1] = 66'h2df52565a2015bad0;
    stim[2] = 66'h09a0a954a38e43f03;
    stim[3] = 66'h11e814657e13ee310;
    stim[4] = 66'h1c350b6aeb496a0bd;
    stim[5] = 66'h15f3979cbad94b317;
    stim[6] = 66'h053688fa69e6eba0d;
    stim[7] = 66'h11f38b415d22effbe;
    stim[8] = 66'h00da20eddd35e1942;
    stim[9] = 66'h13d528f667cfe50fa;
    stim[10] = 66'h063f55abaf8babfab;
    stim[11] = 66'h171bcd3560a670c2c;
    stim[12] = 66'h0d5af1d6259bb7ec0;
    stim[13] = 66'h19ebf049873698c6e;
    stim[14] = 66'h124b82afb41a7638a;
    stim[15] = 66'h19aaea73aeab6df71;
    stim[16] = 66'h1365d28aaf85e1339;
    stim[17] = 66'h1668c6953eb4c68f6;
    stim[18] = 66'h107d066a3c49e6aa6;
    stim[19] = 66'h0b099cef4cab540d7;
    stim[20] = 66'h1726a85046106e787;
    stim[21] = 66'h0f77a13ad7d70d94a;
    stim[22] = 66'h1a0a72a7a0e5dee72;
    stim[23] = 66'h0826219436bc069f6;
    stim[24] = 66'h1ae477196c5c8e3e2;
    stim[25] = 66'h0f95f863ae81490cc;
    stim[26] = 66'h1b44e5d54b0d8364e;
    stim[27] = 66'h032a6b03222e54d4d;
    stim[28] = 66'h17b9388ed33d8a8fb;
    stim[29] = 66'h0e428ae53139d025f;
    stim[30] = 66'h1b3bba6e6472d0cf6;
    stim[31] = 66'h16c727c83e8b0a8d3;
    stim[32] = 66'h061ef9263ffac3ab6;
    stim[33] = 66'h1b5824f141492b067;
    stim[34] = 66'h01cda7538777ed33c;
    stim[35] = 66'h0d64f301c8793ab74;
    stim[36] = 66'h0af6036b92125f329;
    stim[37] = 66'h187b8a70291d9f97c;
    stim[38] = 66'h0708abdc52f353e5f;
    stim[39] = 66'h13289da25b434cc73;
    stim[40] = 66'h09149b5c1c64bf9fe;
    stim[41] = 66'h0e72f50eb8e4ff10d;
    stim[42] = 66'h1add687658a959669;
    stim[43] = 66'h195c9e41927a2c85c;
    stim[44] = 66'h05aead70826a83801;
    stim[45] = 66'h05520ef37383f58f9;
    stim[46] = 66'h161da8f86f8289471;
    stim[47] = 66'h171460964444f0606;
    stim[48] = 66'h104bc9b2c3853f590;
    stim[49] = 66'h11caa54f1459c5d73;
    stim[50] = 66'h1d0663bd2cb4fb0fc;
    stim[51] = 66'h07bbd9d2004ea0a0f;
    stim[52] = 66'h00fafeb3da3186211;
    stim[53] = 66'h1413593a269895f92;
    stim[54] = 66'h080aa2e4819cf66ed;
    stim[55] = 66'h1a4de515cedc9903f;
    stim[56] = 66'h1977ad966897208fb;
    stim[57] = 66'h0123727b2687c401f;
    stim[58] = 66'h0cb730682da42b374;
    stim[59] = 66'h1fe6f02a7227fa4d7;
    stim[60] = 66'h11a11e21d839056cd;
    stim[61] = 66'h06b617fa9c358d6a1;
    stim[62] = 66'h08c9f71f5089e9124;
    stim[63] = 66'h14f9c37d28bb8c879;
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
      expv[3] = 12'h094;
      expv[4] = 12'h30d;
      expv[5] = 12'h698;
      expv[6] = 12'h34a;
      expv[7] = 12'h7a2;
      expv[8] = 12'h93b;
      expv[9] = 12'h74d;
      expv[10] = 12'ha07;
      expv[11] = 12'hc06;
      expv[12] = 12'h384;
      expv[13] = 12'h1e9;
      expv[14] = 12'h29e;
      expv[15] = 12'h686;
      expv[16] = 12'h60a;
      expv[17] = 12'h39f;
      expv[18] = 12'ha56;
      expv[19] = 12'h5b1;
      expv[20] = 12'h840;
      expv[21] = 12'hcea;
      expv[22] = 12'hd63;
      expv[23] = 12'ha31;
      expv[24] = 12'h8f7;
      expv[25] = 12'h06d;
      expv[26] = 12'hbf6;
      expv[27] = 12'h591;
      expv[28] = 12'hce8;
      expv[29] = 12'h65e;
      expv[30] = 12'h530;
      expv[31] = 12'h67e;
      expv[32] = 12'he24;
      expv[33] = 12'h068;
      expv[34] = 12'h746;
      expv[35] = 12'h0a8;
      expv[36] = 12'h69a;
      expv[37] = 12'hc7e;
      expv[38] = 12'hd49;
      expv[39] = 12'h0bc;
      expv[40] = 12'hc6f;
      expv[41] = 12'h676;
      expv[42] = 12'hb21;
      expv[43] = 12'hfde;
      expv[44] = 12'h2dc;
      expv[45] = 12'hc85;
      expv[46] = 12'h6d9;
      expv[47] = 12'ha87;
      expv[48] = 12'h8f3;
      expv[49] = 12'h369;
      expv[50] = 12'h167;
      expv[51] = 12'h30c;
      expv[52] = 12'h4dd;
      expv[53] = 12'hb8d;
      expv[54] = 12'hb75;
      expv[55] = 12'h130;
      expv[56] = 12'h9c9;
      expv[57] = 12'h2e1;
      expv[58] = 12'hc5a;
      expv[59] = 12'hc49;
      expv[60] = 12'h931;
      expv[61] = 12'h413;
      expv[62] = 12'h662;
      expv[63] = 12'h5e6;
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
