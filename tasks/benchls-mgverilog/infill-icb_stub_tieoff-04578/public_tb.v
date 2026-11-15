// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 135;
  localparam OW = 68;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04578 dut (
    .clk(clk),
    .rst_n(in_vec[134:134]),
    .i_icb_cmd_valid(in_vec[133:133]),
    .i_icb_cmd_addr(in_vec[132:101]),
    .i_icb_cmd_read(in_vec[100:100]),
    .i_icb_cmd_wdata(in_vec[99:68]),
    .i_icb_rsp_ready(in_vec[67:67]),
    .f_icb_cmd_valid(in_vec[66:66]),
    .f_icb_cmd_addr(in_vec[65:34]),
    .f_icb_cmd_read(in_vec[33:33]),
    .f_icb_cmd_wdata(in_vec[32:1]),
    .f_icb_rsp_ready(in_vec[0:0]),
    .i_icb_cmd_ready(out_vec[67:67]),
    .i_icb_rsp_valid(out_vec[66:66]),
    .i_icb_rsp_rdata(out_vec[65:34]),
    .f_icb_cmd_ready(out_vec[33:33]),
    .f_icb_rsp_valid(out_vec[32:32]),
    .f_icb_rsp_rdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 135'h1a6fc5ffa76a458453db6c7c36f90f699e;
    stim[1] = 135'h030ce669c3e27b416e90bab5034ea0ed18;
    stim[2] = 135'h734875e033ce6d5d13e3365ba6a891bf1c;
    stim[3] = 135'h4ea8a3642b83dba6a70cb7540f46caa7bc;
    stim[4] = 135'h5cd35167c7428fcd7848536999d731a826;
    stim[5] = 135'h541579fdf1c125f350dc50827f1cf98943;
    stim[6] = 135'h57aa72cfd226edf7e3bd01dc27178bb5b8;
    stim[7] = 135'h6fba84e0f7027860d2b781499bc351fc5e;
    stim[8] = 135'h72de9495af6a462e883764115341bc152b;
    stim[9] = 135'h7c6e8cdd64a64037f612b516d9322deafa;
    stim[10] = 135'h7788d3d14ccce22cf7f472d781105ca5bf;
    stim[11] = 135'h7295f9be4cf10470d4d145daa4dae3eee2;
    stim[12] = 135'h45d731bffd504efcceb27432346517ce65;
    stim[13] = 135'h6f316d39cbc5cfea86a39a5b3f237eb144;
    stim[14] = 135'h6d23d1629ffe613271c6bc0b88c5fcdbb1;
    stim[15] = 135'h6a192d9c4857b79b62ef97da2cc6cfdb2b;
    stim[16] = 135'h725d1787844432847f522c496dad9ab7b7;
    stim[17] = 135'h61fedcfa71b0347d619df60b8edba6e373;
    stim[18] = 135'h48d128712377dc185422ba9e4263408321;
    stim[19] = 135'h59eedef2600dcb373226795d3c2791b4ce;
    stim[20] = 135'h7021e6a4254a12959c4900da1f55c9938d;
    stim[21] = 135'h719cde7d8fec3e2bc98ac3b980470b1de2;
    stim[22] = 135'h7da55efe2b47af6b53b1693ae4593afafd;
    stim[23] = 135'h4938b40442e4d399b13734577974611261;
    stim[24] = 135'h6605a7ae33e67c040a2f72af60ee645117;
    stim[25] = 135'h5759ec1a21d8e0bde7f5342d63a56f76ac;
    stim[26] = 135'h72730ef4a1d1716d3ec71bab6e9897938b;
    stim[27] = 135'h453213112e156b02373da9e2620760fab0;
    stim[28] = 135'h7f0044950e1aace42eef0a74c341b54b76;
    stim[29] = 135'h7a70218d130a67cd9203ce294439e2b413;
    stim[30] = 135'h4411a638c7ad2ca8b579e4d74fb2626eca;
    stim[31] = 135'h44467c9a5beebebf7ace89b24f6f51204b;
    stim[32] = 135'h5c8800ff47dbfb3b3b80d2fe50cb5b59bd;
    stim[33] = 135'h7437f41cecaa06ef3d89a320031d824d05;
    stim[34] = 135'h416b3fed19823c8aa9f3c6e311f6c36e43;
    stim[35] = 135'h76635cb77656c76f9a5ef017e45aa53bcc;
    stim[36] = 135'h7dc08569f35e2e8b394665d00ffb06f14a;
    stim[37] = 135'h5f10666fe9deb428f94b5da4f005ae1c58;
    stim[38] = 135'h45b51007d9a844a8a9ff1865f7cfe9b093;
    stim[39] = 135'h47be01950c92188d1b6f3f724e5ed35ab7;
    stim[40] = 135'h44dca9aa5d5f78ad72199a30de3b25fc6c;
    stim[41] = 135'h4a2fa7eb919a2c9ac71dae02141cf09623;
    stim[42] = 135'h758bf66ea24079f2ed015dbb26d1bfa603;
    stim[43] = 135'h6ebd69aa3d1a2fc639f1e3fb6214875ad0;
    stim[44] = 135'h499912b5e56a90ef0e82f6d13f3c784426;
    stim[45] = 135'h4267504b79a92c134c02c0de89cfc45b39;
    stim[46] = 135'h45422bc221dc7d03a6853f9decb79912ef;
    stim[47] = 135'h528c5ee90dfd94ca84cbe7a5b5f0925e1c;
    stim[48] = 135'h6f4d01a1420f74f555f501c2e81319b839;
    stim[49] = 135'h738f9383f417a3de07e34c4bc36cd5b79e;
    stim[50] = 135'h7cc19658e12ae285db34b9c689a8bd6d11;
    stim[51] = 135'h4267fd5c0893ce24d9132303963115cfbe;
    stim[52] = 135'h732e129bf5cd61d00dcae99a8d468d8932;
    stim[53] = 135'h795f50a17885aa5364926db06e3eb55de5;
    stim[54] = 135'h7858abef4173674d33e42e9bcd2ad6be63;
    stim[55] = 135'h77829d397d5e8ec4c64164835cfd01c5d1;
    stim[56] = 135'h501ebdafe4be9669c7fc88bee835cf67ba;
    stim[57] = 135'h7e6dfd722e43525c556b33c09a92ab31e7;
    stim[58] = 135'h6a762ccaac3c36ebd6967c6c87b47dcedc;
    stim[59] = 135'h5d35270e40867b64eb131453c7b0862e44;
    stim[60] = 135'h5c8cee17ce3a193cb6004ea87fd088ab4d;
    stim[61] = 135'h4dd49e7105305f345b7aaf6aee725da39e;
    stim[62] = 135'h4dc9882e7079f215901da3944ad79fca30;
    stim[63] = 135'h4b83d30067556d44aa6bb18b5564e0472d;
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
      expv[0] = 68'h00000000000000000;
      expv[1] = 68'h00000000000000000;
      expv[2] = 68'h00000000000000000;
      expv[3] = 68'h00000000000000000;
      expv[4] = 68'h00000000000000000;
      expv[5] = 68'h00000000000000000;
      expv[6] = 68'h00000000000000000;
      expv[7] = 68'h00000000000000000;
      expv[8] = 68'h00000000000000000;
      expv[9] = 68'h00000000000000000;
      expv[10] = 68'h00000000000000000;
      expv[11] = 68'h00000000000000000;
      expv[12] = 68'h00000000000000000;
      expv[13] = 68'h00000000000000000;
      expv[14] = 68'h00000000000000000;
      expv[15] = 68'h00000000000000000;
      expv[16] = 68'h00000000000000000;
      expv[17] = 68'h00000000000000000;
      expv[18] = 68'h00000000000000000;
      expv[19] = 68'h00000000000000000;
      expv[20] = 68'h00000000000000000;
      expv[21] = 68'h00000000000000000;
      expv[22] = 68'h00000000000000000;
      expv[23] = 68'h00000000000000000;
      expv[24] = 68'h00000000000000000;
      expv[25] = 68'h00000000000000000;
      expv[26] = 68'h00000000000000000;
      expv[27] = 68'h00000000000000000;
      expv[28] = 68'h00000000000000000;
      expv[29] = 68'h00000000000000000;
      expv[30] = 68'h00000000000000000;
      expv[31] = 68'h00000000000000000;
      expv[32] = 68'h00000000000000000;
      expv[33] = 68'h00000000000000000;
      expv[34] = 68'h00000000000000000;
      expv[35] = 68'h00000000000000000;
      expv[36] = 68'h00000000000000000;
      expv[37] = 68'h00000000000000000;
      expv[38] = 68'h00000000000000000;
      expv[39] = 68'h00000000000000000;
      expv[40] = 68'h00000000000000000;
      expv[41] = 68'h00000000000000000;
      expv[42] = 68'h00000000000000000;
      expv[43] = 68'h00000000000000000;
      expv[44] = 68'h00000000000000000;
      expv[45] = 68'h00000000000000000;
      expv[46] = 68'h00000000000000000;
      expv[47] = 68'h00000000000000000;
      expv[48] = 68'h00000000000000000;
      expv[49] = 68'h00000000000000000;
      expv[50] = 68'h00000000000000000;
      expv[51] = 68'h00000000000000000;
      expv[52] = 68'h00000000000000000;
      expv[53] = 68'h00000000000000000;
      expv[54] = 68'h00000000000000000;
      expv[55] = 68'h00000000000000000;
      expv[56] = 68'h00000000000000000;
      expv[57] = 68'h00000000000000000;
      expv[58] = 68'h00000000000000000;
      expv[59] = 68'h00000000000000000;
      expv[60] = 68'h00000000000000000;
      expv[61] = 68'h00000000000000000;
      expv[62] = 68'h00000000000000000;
      expv[63] = 68'h00000000000000000;
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
