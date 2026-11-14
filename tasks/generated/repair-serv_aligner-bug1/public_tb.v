// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .i_ibus_adr(in_vec[65:34]),
    .i_ibus_cyc(in_vec[33:33]),
    .i_wb_ibus_rdt(in_vec[32:1]),
    .i_wb_ibus_ack(in_vec[0:0]),
    .o_ibus_rdt(out_vec[65:34]),
    .o_ibus_ack(out_vec[33:33]),
    .o_wb_ibus_adr(out_vec[32:1]),
    .o_wb_ibus_cyc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h72b6a0f61bf72acb6;
    stim[1] = 67'h425e8d6cf1c9a7552;
    stim[2] = 67'h0196340149489f776;
    stim[3] = 67'h33f75f99d70099b9e;
    stim[4] = 67'h2d55f34314518ee37;
    stim[5] = 67'h066be8641244ddcec;
    stim[6] = 67'h0a33c383dbda062c2;
    stim[7] = 67'h3efa6cd54abb0d5a5;
    stim[8] = 67'h31e66f0aed22abe62;
    stim[9] = 67'h314035bb302b2c325;
    stim[10] = 67'h25d7fb5c2c18d43c0;
    stim[11] = 67'h28723bfc3a10e8844;
    stim[12] = 67'h1ebf0b4d1a5ada90c;
    stim[13] = 67'h3bb23a342b52a356f;
    stim[14] = 67'h32a4cc16dfd41304c;
    stim[15] = 67'h14c94065957370173;
    stim[16] = 67'h35a8a7b5a4c9ca9ef;
    stim[17] = 67'h3700afa0deef0718a;
    stim[18] = 67'h34b18c729f72d2941;
    stim[19] = 67'h3926de04fac4d5df5;
    stim[20] = 67'h39318f1239ecbb9cb;
    stim[21] = 67'h1cb3c0147f35e9b1d;
    stim[22] = 67'h1b33d8ef126c934c9;
    stim[23] = 67'h1686d20a28f177426;
    stim[24] = 67'h0c9c77ee10fdbcf5e;
    stim[25] = 67'h14cc0a923fef8e3e4;
    stim[26] = 67'h1da2ddd09ff28c60a;
    stim[27] = 67'h08fe8f5291def8fe2;
    stim[28] = 67'h25580ad783f9a792b;
    stim[29] = 67'h1dd19879ddd3d4bd1;
    stim[30] = 67'h000598e0901df939b;
    stim[31] = 67'h166d3b96345b3c792;
    stim[32] = 67'h221bc9435adcbf33c;
    stim[33] = 67'h0e8c664aedfd40585;
    stim[34] = 67'h24c9fdd6d74281cf3;
    stim[35] = 67'h0837a0c65534ed850;
    stim[36] = 67'h1d1cd2d76c3434a35;
    stim[37] = 67'h206575e3db3e19094;
    stim[38] = 67'h23fe31341fa4d7f33;
    stim[39] = 67'h133e8c1ea013de4a7;
    stim[40] = 67'h34232dfdd28748a95;
    stim[41] = 67'h24d88586cb97cdca6;
    stim[42] = 67'h165c28f778863234a;
    stim[43] = 67'h3272be5eb313e30f3;
    stim[44] = 67'h3f34e18a97cb0bef4;
    stim[45] = 67'h3421104a792919d19;
    stim[46] = 67'h3ff3acc787b16e532;
    stim[47] = 67'h276432d8b07e8af99;
    stim[48] = 67'h01f05fb160e18991f;
    stim[49] = 67'h13230cbabd2086d82;
    stim[50] = 67'h18fcae970b69f9205;
    stim[51] = 67'h15ad8cee96023953c;
    stim[52] = 67'h3e5db0c01445e0e22;
    stim[53] = 67'h361e3f5ddb3e577c0;
    stim[54] = 67'h28ea5d63d883a8e81;
    stim[55] = 67'h27e4f4c59188ea9b2;
    stim[56] = 67'h114241d3e6761aebc;
    stim[57] = 67'h016d32e620bb95ade;
    stim[58] = 67'h30441b5b3416af31f;
    stim[59] = 67'h286b171161e040a26;
    stim[60] = 67'h1af0e55c41a6169c2;
    stim[61] = 67'h3548b87282c232974;
    stim[62] = 67'h3242632f12db3e734;
    stim[63] = 67'h3269181700d8ad6ab;
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
      expv[0] = 66'hxxxxxxxxx95b507bx;
      expv[1] = 66'h23934eaa412f46b67;
      expv[2] = 66'h12913eeec0cb1a00a;
      expv[3] = 66'h2e013373d9fbafcce;
      expv[4] = 66'h28a31dc6f6aaf9a18;
      expv[5] = 66'h2489bb9d8335f4320;
      expv[6] = 66'h37b40c584519e1c1e;
      expv[7] = 66'h15761ab4bf7d366aa;
      expv[8] = 66'h1a4557cc58f337857;
      expv[9] = 66'h20565864b8a01add9;
      expv[10] = 66'h1831a87812ebfdae1;
      expv[11] = 66'h3421d10894391dfe1;
      expv[12] = 66'h34b5b5218f5f85a68;
      expv[13] = 66'h16a546adfdd91d1a1;
      expv[14] = 66'h3fa826099952660b6;
      expv[15] = 66'h2ae6e02e4a64a032c;
      expv[16] = 66'h153deae6fad453db1;
      expv[17] = 66'h3dde0e315b8057d06;
      expv[18] = 66'h3ee5a5281a58c6394;
      expv[19] = 66'h2bbebee5bc936f02b;
      expv[20] = 66'h33d977397c98c7891;
      expv[21] = 66'h3e6bd363ae59e00a3;
      expv[22] = 66'h24d926992d99ec778;
      expv[23] = 66'h11e2ee84cb4369051;
      expv[24] = 66'h21fb79ebc64e3bf70;
      expv[25] = 66'h3fdf1c7c8a6605491;
      expv[26] = 66'h3fe518c14ed16ee84;
      expv[27] = 66'h23bdf1fc447f47a94;
      expv[28] = 66'h07f34f2552ac056bc;
      expv[29] = 66'h297a07f36ee8cc3d2;
      expv[30] = 66'h203bf2734002cc704;
      expv[31] = 66'h38f2603bcb369dcb5;
      expv[32] = 66'h3e67a03bd10de4a1e;
      expv[33] = 66'h00b0a03be7463325b;
      expv[34] = 66'h2e85039e5264feeb6;
      expv[35] = 66'h1b0a2e85041bd0636;
      expv[36] = 66'h2946ae852e8e696bf;
      expv[37] = 66'h321298685032baf22;
      expv[38] = 66'h2fe6586871ff189a4;
      expv[39] = 66'h3c94ff49a99f460f9;
      expv[40] = 66'h250e91529a1196fee;
      expv[41] = 66'h1b94e50e926c42c3a;
      expv[42] = 66'h2469650e8b2e147bf;
      expv[43] = 66'h061e650eb9395f2f9;
      expv[44] = 66'h2f9617de9f9a70c54;
      expv[45] = 66'h325233a33a1088253;
      expv[46] = 66'h0f62dca65ff9d663c;
      expv[47] = 66'h20fd15f313b2196c5;
      expv[48] = 66'h1323e0fd20f82fd8f;
      expv[49] = 66'h0db041c30991865d9;
      expv[50] = 66'h324081c32c7e574bc;
      expv[51] = 66'h32a796d3cad6c6778;
      expv[52] = 66'h01c456d3df2ed8604;
      expv[53] = 66'h2ef816d3db0f1faf2;
      expv[54] = 66'h11d016d3f4752eb22;
      expv[55] = 66'h2311d53653f27a62c;
      expv[56] = 66'h0cec35d788a120e9f;
      expv[57] = 66'h01772b5bc0b699731;
      expv[58] = 66'h282d5e63f8220dad9;
      expv[59] = 66'h03c08144d4358b88b;
      expv[60] = 66'h034c2d384d7872ae2;
      expv[61] = 66'h0584652e9aa45c394;
      expv[62] = 66'h25b67ce6992131978;
      expv[63] = 66'h01b15ad579348c0b8;
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
